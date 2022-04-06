//
//  IndexCollectionViewCell.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import UIKit

class IndexCollectionViewCell: UICollectionViewCell {
    
	
	var headerImage: UIImageView!
	var headerLabel: UILabel!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		self.headerImage = .init()
		self.headerLabel = .init()
		self.headerLabel.textAlignment = .center
		self.headerLabel.numberOfLines = 0
		self.headerLabel.lineBreakMode = .byWordWrapping
		
		self.headerImage.translatesAutoresizingMaskIntoConstraints = false
		self.headerLabel.translatesAutoresizingMaskIntoConstraints = false
		self.contentView.addSubview(self.headerImage)
		self.contentView.addSubview(self.headerLabel)
		
		self.headerImage.anchorTo(self.contentView, anchors: .top, .trailing, .leading)
		self.headerLabel.anchorTo(self.contentView, anchors: .trailing, .leading)
		self.headerLabel.anchorTo(self.contentView, anchors: .bottom, constant: 10)

		self.headerLabel.topAnchor.constraint(equalTo: self.headerImage.bottomAnchor, constant: 10).isActive = true
		self.headerLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
