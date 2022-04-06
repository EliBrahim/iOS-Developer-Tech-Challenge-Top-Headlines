//
//  IndexDetailViewController.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 6/4/2022.
//

import UIKit


protocol IndexDetailViewControllerDelegate: AnyObject {
	
	func viewIsReady()
}

struct IndexDetailViewData {
	
	let author: String?
	let title: String?
	let description: String?
	let image: UIImage?
	
}


class IndexDetailViewController: UIViewController {
	
	var data: IndexDetailViewData?
	weak var delegate: IndexDetailViewControllerDelegate?
	
	// - Attr Views
	
	var imageArticle: UIImageView!
	var labelTitle: UILabel!
	var labelAuthor: UILabel!
	var labelDescription: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
		
		self.view.backgroundColor = .white
		
		self.labelTitle.textAlignment = .center
		self.labelTitle.font = .systemFont(ofSize: 18, weight: .semibold)
		self.labelDescription.font = .systemFont(ofSize: 15, weight: .light)
		
		self.labelTitle.text = data?.title
		self.labelAuthor.text = data?.author
		self.labelDescription.text = data?.description
		self.imageArticle.image = data?.image

		self.labelTitle.numberOfLines = 0
		self.labelAuthor.numberOfLines = 0
		self.labelDescription.numberOfLines = 0
		
		self.labelTitle.lineBreakMode = .byWordWrapping
		self.labelAuthor.lineBreakMode = .byWordWrapping
		self.labelDescription.lineBreakMode = .byWordWrapping
		
		self.imageArticle.translatesAutoresizingMaskIntoConstraints = false
		self.labelTitle.translatesAutoresizingMaskIntoConstraints = false
		self.labelAuthor.translatesAutoresizingMaskIntoConstraints = false
		self.labelDescription.translatesAutoresizingMaskIntoConstraints = false
		
		self.view.addSubview(self.imageArticle)
		self.view.addSubview(self.labelTitle)
		self.view.addSubview(self.labelAuthor)
		self.view.addSubview(self.labelDescription)
		
		self.labelTitle.anchorTo(self.view.safeAreaLayoutGuide, anchors: .top, .leading, .trailing, constant: 20)
		self.imageArticle.anchorTo(self.view.safeAreaLayoutGuide, anchors: .leading, .trailing, constant: 10)
		self.labelAuthor.anchorTo(self.view.safeAreaLayoutGuide, anchors: .leading, .trailing, constant: 10)
		self.labelDescription.anchorTo(self.view.safeAreaLayoutGuide, anchors: .leading, .trailing, constant: 10)
		
		self.imageArticle.topAnchor.constraint(equalTo: self.labelTitle.bottomAnchor, constant: 20).isActive = true
		self.labelAuthor.topAnchor.constraint(equalTo: self.imageArticle.bottomAnchor, constant: 20).isActive = true
		self.labelDescription.topAnchor.constraint(equalTo: self.labelAuthor.bottomAnchor, constant: 20).isActive = true
		
		self.imageArticle.heightAnchor.constraint(lessThanOrEqualTo: self.view.heightAnchor, multiplier: 0.5).isActive = true

    }
	
	func setupViews() {
		
		self.imageArticle = .init()
		self.labelTitle = .init()
		self.labelAuthor = .init()
		self.labelDescription = .init()
	}
    

}
