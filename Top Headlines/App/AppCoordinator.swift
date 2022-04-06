//
//  AppCoordinator.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import UIKit


class AppCoordinator {
	
	var indexCoordinator: IndexCoordinator
	
	init() {
		self.indexCoordinator = .init()
	}
	
	func start(window: UIWindow) {
		
		guard let view = indexCoordinator.makeView() else { return }
		window.rootViewController = UINavigationController(rootViewController: view)
		window.makeKeyAndVisible()
		
	}
}
