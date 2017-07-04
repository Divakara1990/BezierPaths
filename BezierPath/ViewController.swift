//
//  ViewController.swift
//  BezierPath
//
//  Created by suresh on 05/06/17.
//  Copyright © 2017 NextEducation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        let width: CGFloat = 240.0
        let height: CGFloat = 160.0
        
        let demoView = DemoView(frame: CGRect(x: self.view.frame.size.width/2 - width/2
            , y: self.view.frame.size.height/2 - height/2, width: width, height: height))
        self.view.addSubview(demoView)
    }


}

