//
//  Item.swift
//  ShoppingList
//
//  Created by Robert Wadlow on 5/1/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import Foundation

class Item
{
    var name : String!
    var quantity: Int!
    
    init(name: String, quantity: Int)
    {
        self.name = name
        self.quantity = quantity
    }
}
