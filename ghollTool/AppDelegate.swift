//
//  AppDelegate.swift
//  macappTest
//
//  Created by gholl on 2017/11/10.
//  Copyright © 2017年 gholl. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate,AddDocControllerDelegate,NSMenuDelegate {

    @IBOutlet weak var docmenu: NSMenu!
    
    @IBAction func lock(_ sender: Any) {
        let p=Process()
        p.launchPath="/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession"
        p.arguments=["-suspend"]
        p.launch()
    }
    
    @IBAction func home(_ sender: Any) {
       
    }
    
    @IBAction func blog(_ sender: Any) {
//        let wvc = self.storyboard?.instantiateController(withIdentifier: "web_blog") as! WebController
//        self.presentViewControllerAsModalWindow(wvc)
        

    }
    
    @IBAction func bookSearch(_ sender: Any) {
//        let wvc = self.storyboard?.instantiateController(withIdentifier: "web_blog") as! WebController
//        wvc.setUrl(url:"http://www.gholl.com/book")
//        self.presentViewControllerAsModalWindow(wvc)

    }
    @IBAction func quit(_ sender: NSMenuItem) {
        print("quit")
        NSApplication.shared().terminate(self)
    }
    
    var docM:NSMenu = NSMenu.init()
    @IBOutlet weak var statusMenu: NSMenu!
    let statusItem = NSStatusBar.system().statusItem(withLength: NSVariableStatusItemLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
        statusItem.title = "Gholl"
        statusItem.menu = statusMenu
        docM = docmenu
        docmenu.delegate = self
        print(docmenu)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func onDocMenuAdd(item: NSMenuItem) {
        docM.addItem(item)
        print(docM.description)

    }
    
    func menuWillOpen(_ menu: NSMenu) {
//        menu.removeAllItems()
        for i in menu.items{
            print(String(describing: i.identifier))
            if(i.identifier != "sp" && i.identifier != "add_doc"){
                menu.removeItem(i)
            }
        }
        let base:String = NSHomeDirectory() + "/Documents/"
        let mf_name:String = "gholl_tool_mark.plist"
        let filePath:String = base+mf_name

        let dictionary = NSDictionary(contentsOfFile: filePath)
        if(dictionary != nil){
            for (key,value) in dictionary!{
                _ = #selector(menuClick)
                let item:DocMenuItem = DocMenuItem.init()
                item.title = key as! String
                item.action = #selector(self.menuClick)
                item.KEY = key as! String
                item.VALUE = (value as! NSDictionary)["value"] as! String
                item.TYPE = (value as! NSDictionary)["type"] as! String
                menu.addItem(item)
            }

        }
        
        
    }
    
    @objc private func menuClick(item:DocMenuItem){
        print("menu click")
        print(item.KEY)
        print(item.VALUE)
        NSWorkspace.shared().open(URL(string:item.VALUE)!)
    
       //        NSWorkspace.shared().activateFileViewerSelecting([URL(string:item.VALUE)!])
//        NSWorkspace.shared().openFile(item.VALUE,withApplication: "Sublime Text")
    }

}

