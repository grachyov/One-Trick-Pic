//
//  OTPTodayViewController.swift
//  One Trick Pic Widget
//
//  Created by Ivan Grachev on 26/02/15.
//  Copyright (c) 2015 Ivan Grachev. All rights reserved.
//

import UIKit
import NotificationCenter
import OneTrickPicKit

class OTPTodayViewController: UIViewController, NCWidgetProviding {
    
    let imageManager = OTPPhotosManager()
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("widget view did load")
        preferredContentSize.height = 70
    }

    func widgetPerformUpdateWithCompletionHandler(completionHandler: ((NCUpdateResult) -> Void)!) {
        // Perform any setup necessary in order to update the view.

        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData

        completionHandler(NCUpdateResult.NewData)
    }
    
    func widgetMarginInsetsForProposedMarginInsets(defaultMarginInsets: UIEdgeInsets) -> UIEdgeInsets {
        return UIEdgeInsetsZero
    }
    
    @IBAction func copyAndDeleteButtonPressed(sender: AnyObject) {
        println("copyAndDeleteButtonPressed")
        imageManager.copyAndDeleteLastImage()
    }
    
}
