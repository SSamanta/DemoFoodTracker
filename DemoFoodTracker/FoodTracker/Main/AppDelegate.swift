//
//  AppDelegate.swift
//  FoodTracker
//
//  Created by Susim Samanta on 15/06/18.
 
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        loadInitialWindowScene()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


    //MARK: Load initial window scene
    
    func loadInitialWindowScene() {
        if UserDefaults.standard.bool(forKey: "IS_LOGGED_IN")  {
           loadMainScene()
        }else {
            loadLoginScene()
        }
    }
    
    func loadMainScene() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let mainScene = storyBoard.instantiateViewController(withIdentifier: "RootTabbarScene") as? UITabBarController {
            UserDefaults.standard.set(true, forKey: "IS_LOGGED_IN")
            self.window?.rootViewController = mainScene
        }
    }
    
    func loadLoginScene() {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        if let rootLoginScene = storyBoard.instantiateViewController(withIdentifier: "RootLoginScene") as? UINavigationController {
            UserDefaults.standard.set(false, forKey: "IS_LOGGED_IN")
            self.window?.rootViewController = rootLoginScene
        }
    }
}

