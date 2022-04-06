//
//  IndexViewController.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import UIKit

protocol IndexViewControllerDelegate: AnyObject {
	
	func viewIsReady()
	func willDisplayCell(_ cell: IndexCollectionViewCell, item: IndexViewData)
	func didSelectItemAt(index: IndexPath)
}

struct IndexViewData {
	
	let id: String 
	let title: String?
	let imageURL: URL?
	
}

class IndexViewController: UIViewController {
	
	
	lazy var collectionView: UICollectionView! = {
		
		let flow = UICollectionViewFlowLayout()
		flow.scrollDirection = .horizontal
		
		let collectionView = UICollectionView.init(frame: .zero, collectionViewLayout: flow)
		self.view.addSubview(collectionView)
		
		collectionView.register(IndexCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collectionView.backgroundColor = .clear
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.anchorTo(self.view.safeAreaLayoutGuide, anchors: .top, .bottom, .leading, .trailing)
		
		return collectionView
	}()
	
	weak var delegate: IndexViewControllerDelegate?
	var data: [IndexViewData] = []
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.title = "Top Heading"
		
		self.view.backgroundColor = .white
		
		self.collectionView.delegate = self
		self.collectionView.dataSource = self
		
		self.delegate?.viewIsReady()
	}

	func setupLoadedImageAt(cell: IndexCollectionViewCell, image: UIImage?) {
		
		cell.headerImage.image = image
	}
}


extension IndexViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		data.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! IndexCollectionViewCell
		
		let item = data[indexPath.row]
		cell.headerLabel.text = item.title
		cell.headerImage.image = nil
		cell.contentView.backgroundColor = .lightGray.withAlphaComponent(0.1)
		cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
		cell.contentView.layer.borderWidth = 0.5
		cell.contentView.layer.cornerRadius = 10
		cell.contentView.clipsToBounds = true
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
		
		self.delegate?.willDisplayCell(cell as! IndexCollectionViewCell, item: data[indexPath.row])
	}
	
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		self.delegate?.didSelectItemAt(index: indexPath)
		
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		
		let w = collectionView.bounds.size.width - 20
		let h = collectionView.bounds.size.height - 30
		
		return .init(width: w, height: h)
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		
		return .init(top: 0, left: 10, bottom: 20, right: -10)
	}
	
}

extension UIView {
	
	
	func centerH(_ to: Any!, widthMultiplier: Double) {
		
		NSLayoutConstraint.init(
			item: self, attribute: .width, relatedBy: .equal, toItem: to, attribute: .width, multiplier: widthMultiplier, constant: 0
		).isActive = true
		NSLayoutConstraint.init(
			item: self, attribute: .centerX, relatedBy: .equal, toItem: to, attribute: .centerX, multiplier: 1, constant: 0
		).isActive = true
		
	}
	
	func anchorTo(_ to: Any!, anchors: NSLayoutConstraint.Attribute..., constant: CGFloat = 0) {
		
		for anchor in anchors {
			
			let c = constant * (anchor == .trailing || anchor == .bottom ? -1 : 1)
			
			NSLayoutConstraint.init(
				item: self, attribute: anchor, relatedBy: .equal, toItem: to, attribute: anchor, multiplier: 1, constant: c
			).isActive = true
		}
	}
}
