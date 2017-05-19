#!/usr/bin/python

import argparse, sys, json, urllib, os

from Foundation import NSMutableDictionary

print("Using Python version: " + sys.version)

config_file = os.environ['TARGET_CONFIG']
inDict = json.loads(config_file)
print(inDict)

project_dir = os.environ['PROJECT_DIR']

outDict = None
outFile = project_dir+"/bitrise_test/Info.plist"
outDict = NSMutableDictionary.dictionaryWithContentsOfFile_(outFile)

try:
	os.environ['PRODUCT_NAME'] = inDict['name']
	bundleId = os.environ['PRODUCT_BUNDLE_IDENTIFIER']
	splitBundleIdentifier = bundleId.split('.')
	splitBundleIdentifier.pop()
	splitBundleIdentifier.append(inDict['name'])
	os.environ['PRODUCT_BUNDLE_IDENTIFIER'] = '.'.join(splitBundleIdentifier)
	outDict['CFBundleShortVersionString'] = inDict['version']
	outDict['CFBundleVersion'] = inDict['build']
except:
	print("Failed to apply config. Please verfiy all keys are correct in input file.")
	sys.exit(2)

success = outDict.writeToFile_atomically_(outFile, 1)
if not success:
    print "Failed to write output file."
    sys.exit(1)

urllib.urlretrieve('http://' + inDict['icon'], project_dir + '/images/AppIcon60x60@2x.png')
urllib.urlretrieve('http://' + inDict['splash']['foreground'], project_dir + '/images/global_logo.png')
urllib.urlretrieve('http://' + inDict['splash']['background'], project_dir + '/images/global_background.png')

