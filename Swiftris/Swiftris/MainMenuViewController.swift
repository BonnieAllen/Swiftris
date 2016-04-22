//
//  MainMenuViewController.swift
//  Swiftris
//
//  Created by King Kittenhead on 4/20/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController: GameViewController = (segue.destinationViewController as? GameViewController)!
        
        if (segue.identifier == "timedGameSegue") {
            viewController.defaultTimer = 120
        } else if (segue.identifier == "endlessGameSegue") {
            viewController.defaultTimer = 0
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
