//
//  SceneDelegate.swift
//  CharactersApp
//
//  Created by Kevin Verghese on 6/14/23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var splitVC: UISplitViewController?
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let sceneWindow = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: sceneWindow)
        
        // Set up the appropriate root view controller
        if UIDevice.current.userInterfaceIdiom == .phone {
            let characterListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
            let navigationController = UINavigationController(rootViewController: characterListViewController)
            window.rootViewController = navigationController
        } else if UIDevice.current.userInterfaceIdiom == .pad {
            let splitViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SplitView") as! UISplitViewController
            splitViewController.preferredDisplayMode = .oneBesideSecondary
            let characterListViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharactersViewController") as! CharactersViewController
            let characterDetailsViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "CharDetail") as! CharacterDetailsViewController
            splitViewController.preferredDisplayMode = .oneBesideSecondary
            splitViewController.viewControllers = [characterListViewController, characterDetailsViewController]
            splitViewController.setViewController(characterListViewController, for: .primary)
            window.rootViewController = splitViewController
        }
        window.makeKeyAndVisible()
        self.window = window
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
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

