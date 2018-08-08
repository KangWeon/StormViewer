//
//  DetailViewController.swift
//  StormViewer
//
//  Created by klarheit on 07/08/2018.
//  Copyright © 2018 klarheit. All rights reserved.
//

import Cocoa

class DetailViewController: NSViewController {
    
    @IBOutlet var imageView: NSImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        NSLog("%@, %@", #file, #function)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        NSLog("%@, %@", #file, #function)
        
    }
    
    func imageSelected(name: String) {
        if imageView == nil {
            imageView = NSImageView(frame: NSRect(origin: self.view.frame.origin, size: self.view.frame.size))
            
            self.view.addSubview(imageView)
        }
        imageView.image = NSImage(named: NSImage.Name(name))
    }
    
}
