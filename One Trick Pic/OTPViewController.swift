//
//  OTPViewController.swift
//  One Trick Pic
//
//  Created by Ivan Grachev on 26/02/15.
//  Copyright (c) 2015 Ivan Grachev. All rights reserved.
//

import UIKit

class OTPViewController: UIViewController {

    let imageManager = OTPImageManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func copyAndDeleteButtonPressed(sender: AnyObject) {
        imageManager.copyAndDeleteLastImage()
    }
}

