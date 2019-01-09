//
//  ViewController.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import UIKit
import Alamofire

class HomeViewController: UITableViewController {
    
    var selectedCustomCollection : CustomCollection?
    
    var customCollections : [CustomCollection] = []
    
    let activityIndicator : UIActivityIndicatorView  = {
        let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
        activity.translatesAutoresizingMaskIntoConstraints = false
        activity.hidesWhenStopped = true
        return activity
    }()
    
    
    override func viewDidLoad() {
        
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: CONSTANTS.HOME_VIEW_CELL_IDENTIFIER)
        
        self.view.addSubview(activityIndicator)
        
        activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive =  true
        activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 50).isActive =  true
        activityIndicator.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.tableView.separatorStyle = .none
        activityIndicator.startAnimating()
        DataManager.Instance().loadCustomCollections(urlString: CONSTANTS.CUSTOM_COLLECTIONS_URL_STRING) { (customCollections) in
            
            guard let collectionsUnWrapped = customCollections else {return}
            
            DispatchQueue.main.async {
                
                self.activityIndicator.stopAnimating()
                self.tableView.separatorStyle = .singleLine
                self.customCollections.append(contentsOf: collectionsUnWrapped)
                self.tableView.reloadData()
            }
        }
        self.title = "Custom Collections"
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return customCollections.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CONSTANTS.HOME_VIEW_CELL_IDENTIFIER, for: indexPath)
        
        cell.textLabel?.text = self.customCollections[indexPath.row].title
        cell.textLabel?.font =  UIFont(name: "Lato-Light", size: CGFloat(Float(18).getHeightWithCorrectRatio()))
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedIndex = indexPath.row
        
        selectedCustomCollection = self.customCollections[selectedIndex]
        self.performSegue(withIdentifier: CONSTANTS.SHOW_PRODUCT_DETAIL_SEGEUE_IDENTIFIER, sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == CONSTANTS.SHOW_PRODUCT_DETAIL_SEGEUE_IDENTIFIER){
            if let productDetailViewController = segue.destination as? ProductsDetailTableViewController{
                productDetailViewController.selectedCustomCollection = self.selectedCustomCollection
            }
        }
    }
}

