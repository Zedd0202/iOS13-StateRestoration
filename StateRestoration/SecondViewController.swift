//
//  SecondViewController.swift
//  StateRestoration
//
//  Created by Zedd on 2020/06/23.
//  Copyright © 2020 Zedd. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    class var activityType: String {
        let activityType = ""
        
        if let activityTypes = Bundle.main.infoDictionary?["NSUserActivityTypes"] {
            if let activityArray = activityTypes as? [String] {
                return activityArray[0]
            }
        }
        return activityType
    }

    var detailUserActivity: NSUserActivity {
        let userActivity = NSUserActivity(activityType: SecondViewController.activityType)
        userActivity.title = "Restore Item"
        userActivity.addUserInfoEntries(from: ["title": self.title])
        return userActivity
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .yellow
    }
}
