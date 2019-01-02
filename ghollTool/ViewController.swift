//
//  ViewController.swift
//  macappTest
//
//  Created by gholl on 2017/11/10.
//  Copyright © 2017年 gholl. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    @IBAction func lock(_ sender: Any) {
        let p=Process()
        p.launchPath="/System/Library/CoreServices/Menu Extras/User.menu/Contents/Resources/CGSession"
        p.arguments=["-suspend"]
        p.launch()
    }
    @IBAction func home(_ sender: Any) {
//        let anim: NSViewControllerPresentationAnimator
//        self.presentViewController(WebController(), animator: anim)
        print("click!!!--home")
        let wvc = self.storyboard?.instantiateController(withIdentifier: "web_blog") as! WebController
        wvc.setUrl(url:"http://www.gholl.com/book")
        self.presentViewControllerAsModalWindow(wvc)
    }
    
    @IBAction func button(_ sender: Any) {
        print("click!!!")
        if #available(OSX 10.12.2, *) {
            self.touchBar = nil
        } else {
            // Fallback on earlier versions
        }
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


}

