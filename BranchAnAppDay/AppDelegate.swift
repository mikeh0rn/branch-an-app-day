//
//  AppDelegate.swift
//  BranchAnAppDay
//
//  Created by Michael Horn on 7/31/20.
//  Copyright © 2020 Mike Horn. All rights reserved.
//

import UIKit
import Branch

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      // listener for Branch Deep Link data
      Branch.getInstance().enableLogging()
      Branch.getInstance().initSession(launchOptions: launchOptions) { (params, error) in
           // do stuff with deep link data (nav to page, display content, etc)
          print(params as? [String: AnyObject] ?? {})

            let storyboard = UIStoryboard(name: "Main", bundle: nil);
            let detailViewController: DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController;
            let name = params?["name"] as! String?
            let role = params?["role"] as! String?
            let location = params?["location"] as! String?
        if let unwrappedName = name, let unwrappedRole = role, let unwrappedLocation = location {
                detailViewController.name = unwrappedName
        detailViewController.role = unwrappedRole
           detailViewController.location = unwrappedLocation

            let rootViewController = self.window?.rootViewController as! UINavigationController;
            rootViewController.pushViewController(detailViewController, animated: true);
        }

      }
      return true
    }

    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        return Branch.getInstance().application(app, open: url, options: options)
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
      // handler for Universal Links
        return Branch.getInstance().continue(userActivity)
    }

    func application(_ application: UIApplication, willContinueUserActivityWithType userActivityType: String) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
      // handler for Push Notifications
      Branch.getInstance().handlePushNotification(userInfo)
    }


}

