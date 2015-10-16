//
//  ArticleView.swift
//  Pods
//
//  Created by mani on 7/28/15.
//
//

import UIKit
import React

public class ArticleView: UIView {

    private var rootView : RCTRootView?
    private var jsCodeLocation : NSURL = NSURL(string: "http://localhost:8081/index.ios.bundle")!
    
    public var articleLocation : NSURL? {
        didSet {
            if let react = rootView {
                react.removeFromSuperview()
                rootView = nil
            }
            
            if let location = articleLocation {
                rootView = RCTRootView(bundleURL: jsCodeLocation, moduleName: "ArticleView", launchOptions: nil)
                rootView!.initialProperties = ["articleURL" : "http://localhost:8081/article.json"]
                self.addSubview(rootView!)
                rootView!.frame = self.bounds
            }
        }
    }
    
    override public func layoutSubviews() {
        if let react = self.rootView {
            react.frame = self.bounds
        }
    }
}
