//
//  ProductsDetailTableViewController.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import UIKit

class ProductsDetailTableViewController: UITableViewController {
    
    var productDetailViewModels : [ProductDetailViewModel] = []
    
    var selectedCustomCollection : CustomCollection?{
        didSet{
            guard let customCollectionId = selectedCustomCollection?.id else{return}
            
            self.tableView.separatorStyle = .none
            self.activityIndicator.startAnimating()
            let collectString = DataManager.Instance().getSpecificCollectWithID(id: customCollectionId)
            DataManager.Instance().loadCollects(urlString: collectString) { (collectsObject) in
                
                guard let collects = collectsObject else {return}
                
                let ids = collects.map({ (col) -> Int in
                    if let productId = col.product_id{return productId}
                    else{return 0}
                })
                
                let prodcutsUrlString = DataManager.Instance().getUrlOfTheProductDetailsWithEachProductId(ids: ids)
                
                DataManager.Instance().loadProducts(urlString: prodcutsUrlString, withCompletion: { (productsObj) in
                    guard let products = productsObj else{return}
                    products.forEach({ (product) in
                        let productViewModel =  ProductDetailViewModel()
                        productViewModel.customCollection = self.selectedCustomCollection!
                        productViewModel.product = product
                        
                        DispatchQueue.main.async{
                            self.activityIndicator.stopAnimating()
                            self.tableView.separatorStyle = .singleLine
                            self.productDetailViewModels.append(productViewModel)
                            self.tableView.reloadData()
                        }
                    })
                })
            }
        }
    }
    
    let activityIndicator : UIActivityIndicatorView  = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.hidesWhenStopped = true
        return activity
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(ProductDetailTableViewCell.classForCoder(), forCellReuseIdentifier: CONSTANTS.PRODUCT_DETAIL_VIEW_CELL_IDENTIFIER)
        
        self.tableView.setValue(UIColor.lightGray.withAlphaComponent(0.1), forKey: "tableHeaderBackgroundColor")
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive =  true
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive =  true
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productDetailViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.PRODUCT_DETAIL_VIEW_CELL_IDENTIFIER, for: indexPath) as! ProductDetailTableViewCell
        
        cell.productDetailViewModel = productDetailViewModels[indexPath.row]
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Float(150).getHeightWithCorrectRatio())
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
