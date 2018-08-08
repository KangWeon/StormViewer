//
//  SourceViewController.swift
//  StormViewer
//
//  Created by klarheit on 07/08/2018.
//  Copyright © 2018 klarheit. All rights reserved.
//

import Cocoa

class SourceViewController: NSViewController {

    @IBOutlet var tableView: NSTableView!
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        NSLog("%@, %@\n\n", #file, #function)
        
        // get a list of all files in our bundle's resource path
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        // loop over each file we found
        for item in items {
            // if this item starts with "nssl" add it to our array
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
}

extension SourceViewController: NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        return pictures.count
    }
}

extension SourceViewController: NSTableViewDelegate {
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else { return nil }
        vw.textField?.stringValue = pictures[row]
        
        let iv = (vw.viewWithTag(101) as? NSImageView) ?? NSImageView(frame: NSRect(origin: CGPoint(x: vw.frame.origin.x + 5, y: vw.frame.origin.y + 5), size: CGSize(width: vw.frame.width / 8, height: vw.frame.height - 10)))
        
        iv.image = NSImage(named: NSImage.Name(pictures[row]))
        
        return vw
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        guard tableView.selectedRow != -1 else { return }
        guard let splitVC = parent as? NSSplitViewController else { return }
        if let detail = splitVC.children[1] as? DetailViewController {
            detail.imageSelected(name: pictures[tableView.selectedRow])
        }
    }
}
