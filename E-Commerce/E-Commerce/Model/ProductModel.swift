//
//  ProductModel.swift
//  E-Commerce
//
// Created by Iqlima Rahmawati on 24/03/23.

import Foundation
struct ProductModel: Codable{
    let id : Int
    let title : String
    let price : Double
    let category : String
    let description : String
    let image : String
    let rating : Rating
}
struct Rating: Codable {
    let rate: Double
    let count: Int
}

// enum category: String, Codable {
//    case electronics = "electronics"
//    case jewelery = "jewelery"
//    case mensCloting = "men's Cloting"
//    case womensCloting = "women's Cloting"
//}
