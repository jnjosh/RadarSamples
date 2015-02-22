//
//  SampleViewController.swift
//  StoryboardXibsSwift
//
//  Created by Josh Johnson on 2/22/15.
//  Copyright (c) 2015 jnjosh.com. All rights reserved.
//

import UIKit

class SampleViewController: UIViewController {

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        // This line will force the correct behavior when in Swift. However, this is not ideal and
        // is a regression from the Objective-C project's behavior.
        // NSBundle.mainBundle().loadNibNamed("SampleViewController", owner: self, options: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Sample View Controller"
    }

}
