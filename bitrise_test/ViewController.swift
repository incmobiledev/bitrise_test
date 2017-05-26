//
//  ViewController.swift
//  bitrise_test
//
//  Created by Joshua Gresham on 5/19/17.
//  Copyright © 2017 Incomm. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.view.backgroundColor = .gray;
        
        let button = UIButton(frame: CGRect(x: self.view.frame.width/2 - 25, y: self.view.frame.height/3 - 15, width: 50, height: 30));
        button.backgroundColor = .red;
        self.view.addSubview(button);
        
        button.addTarget(self, action: #selector(butTch), for: .touchUpInside);
    }
    
    func butTch() {
        let alert = UIAlertController(title: "", message: "this is an alert", preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: "ok", style: .default, handler: { (action) in
            print("alert dismissed");
        }));
        self.present(alert, animated: true, completion: nil);
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

