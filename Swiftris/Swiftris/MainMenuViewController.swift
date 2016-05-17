//
//  MainMenuViewController.swift
//  Swiftris
//
//  Created by King Kittenhead on 4/20/16.
//  Copyright © 2016 Bloc. All rights reserved.
//

import UIKit
import GameKit

class MainMenuViewController: UIViewController, GKGameCenterControllerDelegate {
    
//    var achievements : [GKAchievements]?
    
    
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
    //MARK: Game Center Implementation of Achievements

    
    @IBAction func leaderboardButtonPressed(sender: UIButton) {
        showLeaderBoard()
    }

    
    func showLeaderBoard() {
        let gameCenterVC = GKGameCenterViewController()
        gameCenterVC.gameCenterDelegate = self
        gameCenterVC.viewState = GKGameCenterViewControllerState.Leaderboards
        gameCenterVC.leaderboardTimeScope = GKLeaderboardTimeScope.AllTime
        gameCenterVC.leaderboardIdentifier = "topScores"
        self.presentViewController(gameCenterVC, animated: true, completion: nil)
        
    }
    
    //MARK: GameCenterViewControllerDelegate Methods
    
    func gameCenterViewControllerDidFinish(gameCenterViewController: GKGameCenterViewController) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
