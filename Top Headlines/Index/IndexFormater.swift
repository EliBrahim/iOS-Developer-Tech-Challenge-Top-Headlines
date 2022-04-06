//
//  IndexFormater.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 6/4/2022.
//

import UIKit


class IndexFormater {
	
	class func formatResponse(response: TopHeadlines?) -> [IndexData] {
		
		response?.articles?.map({ article in
				.init(author: article.author, title: article.title, description: article.description, imageURL: article.urlToImage)
		}) ?? []
		
	}
	
	class func formatViewDataResponse(_ response: [IndexData]) -> [IndexViewData] {
		
		return response.map { item in
				.init(id: item.id, title: item.title, imageURL: item.imageURL)
		}
		
	}
	
	class func formatImage(_ urlToImage: URL?, completion: @escaping (UIImage?) -> ()) {
		
		DispatchQueue.global().async {
			
			do{
				guard let urlToImage = urlToImage else {
					completion(nil)
					return
				}
				
				let data = try Data(contentsOf: urlToImage)
				
				completion(UIImage(data: data))
			}catch{
				print(error)
				completion(nil)
			}
		}
	}
}
