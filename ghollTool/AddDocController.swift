//
//  AddDocController.swift
//  macappTest
//
//  Created by gholl on 2018/4/16.
//  Copyright © 2018年 gholl. All rights reserved.
//

import Cocoa

class AddDocController: NSViewController {
    weak var delegate: AddDocControllerDelegate! = AppDelegate()
    var docMenu: NSMenu = DocMenu()

    @IBOutlet var docname: NSTextField!
    @IBOutlet var link: NSTextField!
    @IBOutlet var add:NSButton!
    @IBAction func add(_ sender: Any) {
        let item:NSMenuItem = NSMenuItem.init()
        item.title = "add a item"
//        NSMenu.popUpContextMenu(docMenu, with: a, for: add!)
//        if let event = NSApplication.shared().currentEvent {
//            NSMenu.popUpContextMenu(docMenu, with: event, for: self.add)
//        }
//        if (delegate != nil){
//            delegate.onDocMenuAdd(item: item)
//
//        }
        AppDelegate().onDocMenuAdd(item: item)
        print(docname.stringValue)
        print(link.stringValue)
        let base:String = NSHomeDirectory() + "/Documents/"
        let mf_name:String = "gholl_tool_mark.plist"
        let filePath:String = base+mf_name
        
        if(!FileExist(path: filePath)){
            createFile(name:mf_name, fileBaseUrl: URL(string:base)!)
        }
        var dict = NSDictionary(contentsOfFile: filePath)
        if(dict == nil){
            dict = NSDictionary()
        }
        var dictionary = dict as! [String : [String:String]]
        var mark = [String:String]()
        mark["value"] = link.stringValue
        mark["type"] = "url"
        dictionary[docname.stringValue] = mark
        (dictionary as NSDictionary).write(toFile: filePath, atomically: true)
        print(dictionary)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    
    func createFile(name:String, fileBaseUrl:URL){
        let manager = FileManager.default
        
        let file = fileBaseUrl.appendingPathComponent(name)
        print("文件: \(file)")
        let exist = manager.fileExists(atPath: file.path)
        if !exist {
            let data = Data(base64Encoded:"aGVsbG8gd29ybGQ=" ,options:.ignoreUnknownCharacters)
            let createSuccess = manager.createFile(atPath: file.path,contents:data,attributes:nil)
            print("文件创建结果: \(createSuccess)")
        }
    }
    
    func FileExist(path:String) -> Bool{
        let manager = FileManager.default
        return manager.fileExists(atPath: path)
    }
    
}

public protocol AddDocControllerDelegate: class {
    //代理方法，必须要实现这个方法
    //如果要让方法为可选，不必一定实现这个方法，可以在`protocol`之前加    @objc，并且在方法前加optional，那么这个代理方法就会变成可选，实现与否都不会影响
    func onDocMenuAdd(item:NSMenuItem) -> Void
}



