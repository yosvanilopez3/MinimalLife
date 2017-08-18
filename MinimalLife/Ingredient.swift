//
//  Ingredient.swift
//  MinimalLife
//
//  Created by Yosvani Lopez on 8/18/17.
//  Copyright © 2017 Yosvani Lopez. All rights reserved.
//

import Foundation

class Ingredient {
    var inStock: Bool!
    var name: String!
    
    init(name: String, inStock: Bool) {
        self.name = name
        self.inStock = inStock
    }
}
