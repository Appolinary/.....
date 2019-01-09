//
//  ProductDetailViewModel.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation

class ProductDetailViewModel {
    
    
    var product : Product?{
        didSet{
            self.productName = product?.title
            product?.variants?.forEach({ (variant) in
                guard let count = self.totalInventory, let addedCount = variant.inventory_quantity else{ return }
                self.totalInventory = count + addedCount
            })
        }
    }
    var customCollection : CustomCollection?{
        didSet{
            self.collectionTitle = customCollection?.title
            self.collectionImageUrl = customCollection?.image?.src
        }
    }
    var productName : String?
    var totalInventory : Int? = 0
    var collectionTitle: String?
    var collectionImageUrl : String?
}
