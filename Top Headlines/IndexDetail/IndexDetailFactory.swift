//
//  IndexDetailFactory.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 6/4/2022.
//

import Foundation


class IndexDetailViewControllerFacotry {
	
	class func createViewBy(data: IndexDetailViewData) -> IndexDetailViewController {
		
		let controller = IndexDetailViewController()
		controller.setupViews()
		controller.data = data
		
		return controller
	}
}
