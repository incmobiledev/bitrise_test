#!/usr/bin/python

import sys, json, urllib, os
build_dir = './build'
archive_path = build_dir + '/Archive'
archive_file = archive_path + '.xcarchive'
export_plist = './configs/Ad-Hoc.plist'

args = ''
args += '-project bitrise_test.xcodeproj '
args += '-scheme Normal '
args += '-configuration release '
args += '-archivePath ./build/Archive '
args += 'archive '
os.system('xcodebuild ' + args)

args = ''
args += '-verbose '
args += '-exportArchive '
args += '-archivePath ' + archive_file + ' '
args += '-exportPath ' + build_dir + ' '
args += '-exportOptionsPlist ' + export_plist + ' '
os.system('xcodebuild ' + args)
