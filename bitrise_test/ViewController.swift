//
//  ViewController.swift
//  bitrise_test
//
//  Created by Joshua Gresham on 5/19/17.
//  Copyright © 2017 Incomm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let nextView = UIViewController();
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .green;
        nextView.view.backgroundColor = .red;
        
        let button = UIButton();
        button.addTarget(self, action: #selector(buttonTouch(sender:)), for: .touchUpInside);
        let width:CGFloat = 80.0;
        let height:CGFloat = 30.0;
        let x = self.view.frame.width/2 - width/2;
        let y = self.view.frame.height/2 - height/2;
        button.setTitle("button", for: .normal);
        button.frame = CGRect(x: x, y: y, width: width, height: height)
        self.view.addSubview(button);
    }
    
    func buttonTouch(sender:UIButton) {
        self.present(nextView, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

