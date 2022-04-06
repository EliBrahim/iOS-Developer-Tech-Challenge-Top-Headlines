//
//  IndexInteractor.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import Foundation

protocol IndexInteractorDelegate: AnyObject {
	func didGetResponse(error: Error)
	func didGetResponse(response: TopHeadlines?)

}

struct TopHeadlines: Codable {
	
	let articles: [Headline]?
	let status: String?
	let code: String?
	
	struct Headline: Codable {
		
		let author: String?
		let title: String?
		let description: String?
		let urlToImage: URL?
	}
}

class IndexInteractor {
	
	weak var delegate: IndexInteractorDelegate?
	
	func getAllTopHeadlines() throws {
		
		try NetworkService.shared.makeRequest(.getTopHeadlines) { result in
			
			switch result {
				case .failure(let error):
					
					self.delegate?.didGetResponse(error: error)
					break
				case .success(let data):
					
					if let data = data {
						self.decodeResponse(data: data)
					}else{
						self.delegate?.didGetResponse(response: nil)
					}
					break
			}
		}
	}
	
	func decodeResponse(data: Data) {
		
		do{
			
			let decoded = try JSONDecoder().decode(TopHeadlines.self, from: data)
			self.delegate?.didGetResponse(response: decoded)
			
		}catch{
			self.delegate?.didGetResponse(error: error)
		}
	}
}
