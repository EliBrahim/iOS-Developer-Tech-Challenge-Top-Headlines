//
//  NetworkService.swift
//  Top Headlines
//
//  Created by Brahim Elmssilha on 5/4/2022.
//

import Foundation

enum EnumNetworkRoutes: String {
	
	case getTopHeadlines = "https://newsapi.org/v2/top-headlines?country=us&apiKey=1e720f9e9cd845bea37152f911eb5dd9"
	
}

extension EnumNetworkRoutes {
	
	var url: URL! {
		
		return URL.init(string: self.rawValue)
	}
}

extension String: Error { }

/// Make calls to API using `NetworkServiceRoute` list of supported routes
///
/// We can configure this service to use differente domaines (prod, test, recette).
///
/// We can add authentication and more capabilities like post request, uploading, downloading data etc...
///
class NetworkService {
	
	typealias Completion = (Result<Data?, Error>) -> ()
	
	// Singlton instance
	static var shared: NetworkService {
		if instance == nil {
			instance = .init()
		}
		return instance
	}
	private static var instance: NetworkService!
	
	private init() {
		
	}
	
	/// Create new Request by route and method
	///
	/// This way we can build the request as needed by adding more functions
	///
	func makeRequest(_ route: EnumNetworkRoutes, completion: @escaping Completion) throws {
		
		guard let url = route.url else {
			completion(.failure("Invalid URL"))
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, _, error in
			
			if let _error = error {
				completion(.failure(_error))
				return
			}
			
			completion(.success(data))
			
		}
		
		task.resume()
		
	}
	
}
