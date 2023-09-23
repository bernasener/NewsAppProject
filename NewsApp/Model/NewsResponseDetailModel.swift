//
//  NewsResponseDetailModel.swift
//  NewsApp
//
//  Created by Berna Şener on 21.09.2023.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let status: String?
    let sources: [Source]?
}

// MARK: - Source
struct NewsResponseDetailModel: Codable {
    let id, name, description: String?
    let url: String?
    let category: Category
    let language, country: String?
}

enum Category: String, Codable {
    case business = "business"
    case entertainment = "entertainment"
    case general = "general"
    case health = "health"
    case science = "science"
    case sports = "sports"
    case technology = "technology"
}
