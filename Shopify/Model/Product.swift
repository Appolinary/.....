//
//  Product.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation

struct Products : Decodable{
    var products : [Product]
}
struct Product : Decodable {
    var id    :    Int?
    var title    :    String?
    var body_html    :    String?
    var vendor    :    String?
    var product_type    :    String?
    var created_at    :    String?
    var handle    :    String?
    var updated_at    :    String?
    var published_at    :    String?
    var template_suffix    :    String?
    var tags    :    String?
    var published_scope    :    String?
    var admin_graphql_api_id    :   String?
    var variants  :  [Variants]?
    var options :     [Options]?
    var images   :     [Image]?
    var image        : Image?
}

struct Variants : Decodable{
    var id    :    Int?
    var product_id    :    Int?
    var title    :    String?
    var price    :    String?
    var sku    : String?
    var position    :    Int?
    var inventory_policy    :    String?
    var compare_at_price    :    String?
    var fulfillment_service    :    String?
    var inventory_management    :    String?
    var option1    :    String?
    var option2    :    String?
    var option3    :    String?
    var created_at    :    String?
    var updated_at    :    String?
    var taxable    :    Bool?
    var barcode    :    String?
    var grams    :    Int?
    var image_id    :    String?
    var weight    :   Double?
    var weight_unit    :    String?
    var inventory_item_id    :    Int?
    var inventory_quantity    :    Int?
    var old_inventory_quantity    :    Int?
    var requires_shipping    :    Bool?
    var admin_graphql_api_id    : String?
}

struct Options : Decodable{
    var id    :    Int?
    var product_id    :    Int?
    var name    :    String?
    var position    :    Int?
    var values : [String]?
}

struct Image : Decodable{
    var id    :    Int?
    var product_id    :    Int?
    var position    :    Int?
    var created_at    :    String?
    var updated_at    :    String?
    var alt    :    String?
    var width    :    Int?
    var height    :    Int?
    var src    :   String?
    var variant_ids : [Int]?
    var admin_graphql_api_id : String
}

