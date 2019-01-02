//
//  NavView.swift
//  macappTest
//
//  Created by gholl on 2018/4/12.
//  Copyright © 2018年 gholl. All rights reserved.
//

import Cocoa
class NavView : NSView{
    
    @IBAction func lock(_ sender: Any) {
        let p=Process()
        p.launchPath="/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession"
        p.arguments=["-suspend"]
        p.launch()
    }
    @IBAction func home(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"http://www.gholl.com")!)
    }
    
    @IBAction func blog(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"http://blog.gholl.com")!)
    }
    
    @IBAction func bookSearch(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"http://www.gholl.com/book")!)
    }
    @IBAction func quit(_ sender: Any) {
        NSApplication.shared().terminate(self)
    }
    
    @IBAction func baidu(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"http://www.baidu.com")!)
    }
    
    @IBAction func google(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"https://www.google.com")!)
    }
    
    @IBAction func fanyi(_ sender: Any) {
        NSWorkspace.shared().open(URL(string:"http://fanyi.baidu.com")!)
    }
}
