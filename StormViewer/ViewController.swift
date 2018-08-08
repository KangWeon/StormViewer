//
//  ViewController.swift
//  StormViewer
//
//  Created by klarheit on 07/08/2018.
//  Copyright © 2018 klarheit. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        NSLog("%@", #function)
        
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
            NSLog("%@", #function)
        }
    }

}

