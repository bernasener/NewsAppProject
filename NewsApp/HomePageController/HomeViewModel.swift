//
//  HomeViewModel.swift
//  NewsApp
//
//  Created by Berna Şener on 19.09.2023.
//

import Foundation

protocol HomeViewModelDelegate: AnyObject {
    func newsFetched(_ articles: [Article])
}

final class HomeViewModel {
    weak var delegate: HomeViewModelDelegate?

    
    func loadNews() {
        let resource = Resource<NewsResponse>(url: .detail)
        NetworkManager.shared.fetchNews(resource: resource) { result in
            if let articles = result.articles {
                print(articles)
                self.delegate?.newsFetched(articles)
            } else {
                self.delegate?.newsFetched([])
            }
        }
    }
    
}
