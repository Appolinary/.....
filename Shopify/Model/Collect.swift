//
//  Collect.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation

struct Collects : Decodable{
    var collects : [Collect]
}

struct Collect : Decodable{
    
    var id    :    Int?
    var collection_id    :    Int?
    var product_id    :    Int?
    var featured    :    Bool?
    var created_at    :    String?
    var updated_at    :    String?
    var position    :    Int?
    var sort_value    :    String?

}
