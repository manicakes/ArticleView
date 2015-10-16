//
//  ViewController.swift
//  ArticleView
//
//  Created by Mani Ghasemlou on 07/28/2015.
//  Copyright (c) 2015 Mani Ghasemlou. All rights reserved.
//

import UIKit
import ArticleView

class ViewController: UIViewController {

    @IBOutlet weak var articleView: ArticleView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        articleView.articleLocation = NSURL(string: "http://foobar")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
