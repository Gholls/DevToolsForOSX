//
//  WebController.swift
//  macappTest
//
//  Created by gholl on 2017/11/10.
//  Copyright © 2017年 gholl. All rights reserved.
//
import Cocoa
import WebKit
class WebController:NSViewController,WebUIDelegate,WebResourceLoadDelegate,WebFrameLoadDelegate,WebEditingDelegate,WebPolicyDelegate{
    var url:String = "http://blog.gholl.com/ghost"
    @IBOutlet var mwb: WebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title="gholl blog！"
        let request = URLRequest(url:URL.init(string: url)!)
        mwb.mainFrame.load(request)
        
        mwb.uiDelegate = self
        mwb.resourceLoadDelegate = self
        mwb.frameLoadDelegate = self
        mwb.editingDelegate = self
        mwb.policyDelegate = self
        // Do any additional setup after loading the view.
    }
    
    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
    func webView(_ sender: WebView!, didFinishLoadFor frame: WebFrame!) {
        print("did load finish!!")
    }
    
    func webView(_ sender: WebView!, willPerformClientRedirectTo URL: URL!, delay seconds: TimeInterval, fire date: Date!, for frame: WebFrame!) {
        print("willPerformClientRedirectTo")
    }
    
    func webView(_ sender: WebView!, resource identifier: Any!, didReceive response: URLResponse!, from dataSource: WebDataSource!) {
        print("didReceive")
    }
    func webView(_ webView: WebView!, decidePolicyForNewWindowAction actionInformation: [AnyHashable : Any]!, request: URLRequest!, newFrameName frameName: String!, decisionListener listener: WebPolicyDecisionListener!){
        print("decidePolicyForNewWindowAction")
        NSWorkspace.shared().open(request.url!)
    }
    
    public func setUrl(url:String){
        print("test")
        self.url = url
    }
}
