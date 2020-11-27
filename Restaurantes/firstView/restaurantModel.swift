//
//  restaurantModel.swift
//  Restaurantes
//
//  Created by Rafael Lehn Batista (P) on 20/11/20.
//  Copyright © 2020 Rafael Lehn Batista (P). All rights reserved.
//

import Foundation

struct RestaurantModel {
    let name: String
    let Id: Int
    let Review: Double
    let type: String
}

struct RestaurantDetailModel {
    var Name: String
    var Category: String
    var Review: Double
    var Adress: String
    var Phone: String
    var About: String
}
