//
//  CustomCollection.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation

struct CustomCollections : Decodable{
    var custom_collections : [CustomCollection]
}

struct CustomCollection : Decodable{
    
    var  id    :    Int?
    var handle    :    String?
    var title    :    String?
    var updated_at    :    String?
    var body_html    :   String?
    var published_at    :    String?
    var sort_order    :String?
    var template_suffix    : String?
    var published_scope    :    String?
    var admin_graphql_api_id :String?
    var image : CustomCollectionImage?
}

struct CustomCollectionImage : Decodable{
    var created_at    :   String?
    var alt    :    String?
    var width    :    Int?
    var height    :    Int?
    var src : String?
}


