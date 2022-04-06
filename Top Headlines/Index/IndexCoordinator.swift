//
//  IndexCoordinator.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import UIKit

struct IndexData {
	
	let id: String = UUID().uuidString
	let author: String?
	let title: String?
	let description: String?
	let imageURL: URL?
	var image: UIImage?
	
}

class IndexCoordinator {
	
	var view: IndexViewController?
	var interactor: IndexInteractor
	var indexDetailCoordinator: IndexDetailCoordinator
	
	var response: [IndexData] = []

	init(){
		self.interactor = .init()
		self.indexDetailCoordinator = .init()
		self.interactor.delegate = self
		
	}
	
	func makeView() -> UIViewController? {
		
		self.view = .init()
		self.view?.delegate = self
		return self.view
	}
	
}

extension IndexCoordinator: IndexViewControllerDelegate {
	
	func viewIsReady() {
		
		do{
			try self.interactor.getAllTopHeadlines()
		}catch{
			print(error)
		}
	}
	
	
	func willDisplayCell(_ cell: IndexCollectionViewCell, item: IndexViewData) {
		
		if let image = response[1].image {
			
			self.view?.setupLoadedImageAt(cell: cell, image: image)

		}else{
			
			IndexFormater.formatImage(item.imageURL) { [weak self] image in
				
				DispatchQueue.main.async {
					self?.view?.setupLoadedImageAt(cell: cell, image: image)
				}
			}
		}
	}
	
	
	func didSelectItemAt(index: IndexPath) {

		let article = self.response[index.row]

		IndexFormater.formatImage(article.imageURL) { [weak self] image in
			
			DispatchQueue.main.async {

				let detailView = self?.indexDetailCoordinator.makeView(
					data: .init(author: article.author, title: article.title, description: article.description, image: image)
				)
			
				if let detailView = detailView {
					self?.view?.present(detailView, animated: true)
				}
			}
		}
	}
	
}

extension IndexCoordinator: IndexInteractorDelegate {
	
	func didGetResponse(error: Error) {
		print(error)
	}
	
	func didGetResponse(response: TopHeadlines?) {
		
		self.response = IndexFormater.formatResponse(response: response)
		
		let viewData = IndexFormater.formatViewDataResponse(self.response)
		DispatchQueue.main.async { [weak self] in
			self?.view?.data = viewData
			self?.view?.collectionView.reloadData()
		}
	}
}
