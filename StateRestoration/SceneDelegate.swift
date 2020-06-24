//
//  SceneDelegate.swift
//  StateRestoration
//
//  Created by Zedd on 2020/06/23.
//  Copyright © 2020 Zedd. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        if let userActivity = connectionOptions.userActivities.first ?? session.stateRestorationActivity {
            if !self.configure(window: self.window, with: userActivity) {
                print("Failed to restore DetailViewController from \(userActivity)")
            }
        }
    }
        
    func configure(window: UIWindow?, with activity: NSUserActivity) -> Bool {
        let detailViewController = SecondViewController()
        if let navigationController = window?.rootViewController as? UINavigationController {
            navigationController.pushViewController(detailViewController, animated: false)
            detailViewController.restoreUserActivityState(activity)
            detailViewController.title = activity.userInfo?["title"] as? String
            return true
        }
        return false
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        if let navController = window!.rootViewController as? UINavigationController {
            if let detailViewController = navController.viewControllers.last as? SecondViewController {
                scene.userActivity = detailViewController.detailUserActivity
            }
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate {
    
    // MARK: State Restoration

        // This is the NSUserActivity that will be used to restore state when the scene reconnects.
        func stateRestorationActivity(for scene: UIScene) -> NSUserActivity? {
            return scene.userActivity
        }
}
