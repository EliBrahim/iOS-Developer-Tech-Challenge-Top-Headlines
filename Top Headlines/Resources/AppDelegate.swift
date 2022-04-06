//
//  AppDelegate.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
	
	var window: UIWindow?
	var appCoordinator: AppCoordinator!
	
	func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
		
		let newWindow = UIWindow(frame: UIScreen.main.bounds)
		
		self.appCoordinator = .init()
		self.appCoordinator.start(window: newWindow)
		self.window = newWindow
		
		return true
	}
	
	
}
