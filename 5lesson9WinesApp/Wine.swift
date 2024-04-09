//
//  Wine.swift
//  5lesson9WinesApp
//
//  Created by Aiturgan Kurmanbekova on 8/4/24.
//

import Foundation

struct Wine: Decodable {
    let winery: String
    let wine: String
    let rating: Rating
    let location: String
    let image: String
    let id: Int
}

struct Rating: Decodable {
    let average: String
    let reviews: String
}
