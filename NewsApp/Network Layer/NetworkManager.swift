//
//  NetworkManager.swift
//  NewsApp
//
//  Created by Berna Şener on 19.09.2023.
//

import Foundation


enum Path {
    case search(searchText: String)
    case detail
    
    var path: URL {
        switch self {
        case .search(let searchText):
            return URL(string: "\(baseUrl)/everything?domains=wsj.com\(searchText)&apiKey=6c48dc241448421bb775737264db2557")!
        case .detail:
            return URL(string: "\(baseUrl)/everything?domains=wsj.com&apiKey=6c48dc241448421bb775737264db2557")!
        }
    }
    
    var baseUrl: String {
        return "https://newsapi.org/v2"
    }
}

struct Resource<news: Decodable> {
    var url: Path
}


final class NetworkManager {
    
    static let shared = NetworkManager()
    
    func fetchNews<T: Decodable>(resource: Resource<T>, succesData: @escaping (NewsResponse) -> Void) {
        
        URLSession.shared.dataTask(with: resource.url.path) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
            }
            
            guard let data else {
                print(error?.localizedDescription)
                return
            }
            
            do {
                let decodedData = try JSONDecoder().decode(NewsResponse.self, from: data)
               succesData(decodedData)
            } catch {
                print(error.localizedDescription)
            }
            
        }.resume()
    }
}

