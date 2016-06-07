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
    
        var achievements : [GKAchievement]?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let viewController: GameViewController = (segue.destinationViewController as? GameViewController)!
        if self.achievements != nil {
            viewController.achievements = self.achievements!
        }

        
        if (segue.identifier == "timedGameSegue") {
            viewController.defaultTimer = 120
        } else if (segue.identifier == "endlessGameSegue") {
            viewController.defaultTimer = 0
        }
    }
    
    func authenticateGameCenter(completion: (() -> Void)?) {
        let localPlayer = GKLocalPlayer.localPlayer()
        localPlayer.authenticateHandler = {(viewController, error) -> Void in
            if ((viewController) != nil) {
                self.presentViewController(viewController!, animated: true, completion: nil)
            } else {
                print("(GameCenter) Player Authenticated: \(GKLocalPlayer.localPlayer().authenticated)")
                if let completion = completion {
                    completion()
                }
            }
        }
    }
    

    
    //MARK: Game Center Implementation of Leaderboard

    
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
    
    //MARK: Game Center Implementation of Achievements

    @IBAction func achievementsButton() {
        showAchievements()
    }
    
    func showAchievements () {
        let gameCenterVC = GKGameCenterViewController()
        gameCenterVC.gameCenterDelegate = self
        gameCenterVC.viewState = GKGameCenterViewControllerState.Achievements
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
