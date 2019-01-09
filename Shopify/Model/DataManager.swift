//
//  DataManager.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation
import Alamofire

class DataManager {
    
    //only one instance of the class is allowed
    private static var privateDataManagerInstance : DataManager?
    
    private init(){
        
    }
    
    //a static method to access the private instance of data manager
    static func Instance() -> DataManager{
        if(privateDataManagerInstance == nil){
            privateDataManagerInstance = DataManager()
        }
        return privateDataManagerInstance!
    }
    
    //loads a list custom collections from the url string
    func  loadCustomCollections(urlString : String, withCompletion : @escaping ([CustomCollection]?) -> ()){
        Alamofire.request(urlString).responseJSON { (responseData) in
            do {
                let  c = try JSONDecoder().decode(CustomCollections.self, from: responseData.data!)
                withCompletion(c.custom_collections)
            } catch  {
                withCompletion(nil)
            }
        }
    }
    
    //loads products given a url string
    func  loadProducts(urlString : String, withCompletion : @escaping ([Product]?) -> ()){
        Alamofire.request(urlString).responseJSON { (responseData) in
            do {
                let  c = try JSONDecoder().decode(Products.self, from: responseData.data!)
                withCompletion(c.products)
            } catch  {
                withCompletion(nil)
            }
        }
    }
    
    //loads collects given a url string
    func  loadCollects(urlString : String, withCompletion : @escaping ([Collect]?) -> ()){
        
        Alamofire.request(urlString).responseJSON { (responseData) in
            do {
                let  c = try JSONDecoder().decode(Collects.self, from: responseData.data!)
                withCompletion(c.collects)
            } catch  {
                withCompletion(nil)
            }
        }
    }
    
    //gets the url string of collects given a specific custom collection identifier
    func getSpecificCollectWithID(id : Int)-> String{
        return "https://shopicruit.myshopify.com/admin/collects.json?collection_id=\(id)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    }
    
    //gets the url string of the products given an array of product_ids
    func getUrlOfTheProductDetailsWithEachProductId(ids : [Int])-> String{
        
        var first = String(ids[0])
        for i in (1..<ids.count){
            first = first + (",") + String(ids[i])
        }
        return "https://shopicruit.myshopify.com/admin/products.json?ids=\(first)&page=1&access_token=c32313df0d0ef512ca64d5b336a0d7c6"
    }
}

