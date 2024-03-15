//
//  AppetizerResponse.swift
//  Appetizers
//
//  Created by User on 15/03/2024.
//

import Foundation
struct AppetizerResponse: Codable{
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageURL: String
    let calories: Int
    let carbs: Int
}
