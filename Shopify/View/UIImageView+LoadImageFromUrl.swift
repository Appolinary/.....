//
//  UIImageView+LoadImageFromUrl.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation
import UIKit

var imageCache  = NSCache<NSString, UIImage>()

let activityIndicator : UIActivityIndicatorView  = {
    let activity = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    activity.translatesAutoresizingMaskIntoConstraints = false
    activity.hidesWhenStopped = true
    return activity
}()

extension UIImageView{
    
    func loadImageWithCache(urlString: String) {
        let url = URL(string: urlString)!
        
        //if the image is already in cache then just set it and return
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            self.image = cachedImage
            return
        }
        //if its not, then load it and put it in the cache for future use
        
        
        addSubview(activityIndicator)
        activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive =  true
        activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        activityIndicator.widthAnchor.constraint(equalToConstant: 30).isActive =  true
        activityIndicator.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        activityIndicator.startAnimating()
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else{
                activityIndicator.stopAnimating()
                return
            }
            DispatchQueue.main.async {
                if let imageData = data, let theImage = UIImage(data: imageData){
                    activityIndicator.stopAnimating()
                    imageCache.setObject(theImage, forKey: url.absoluteString as NSString)
                    self.image = theImage
                }
            }
            }.resume()
    }
}
