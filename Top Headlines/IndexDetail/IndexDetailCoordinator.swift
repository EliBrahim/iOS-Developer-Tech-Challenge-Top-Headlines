//
//  IndexDetailCoordinator.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 6/4/2022.
//

import UIKit


class IndexDetailCoordinator {
	
	var view: IndexDetailViewController?
	
	func makeView(data: IndexDetailViewData) -> UIViewController? {
		
		self.view = IndexDetailViewControllerFacotry.createViewBy(data: data)
		
		return self.view
	}
}

