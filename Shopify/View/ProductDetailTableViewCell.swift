//
//  ProductDetailTableViewCell.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import UIKit

class ProductDetailTableViewCell: UITableViewCell {
    
    fileprivate lazy var myImageView : UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints =  false
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        
        return imageView
    }()
    
    fileprivate lazy var productNameTextLabel : UILabel = {
        let textLabel  =  UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.contentMode = .scaleAspectFit
        textLabel.numberOfLines = 0
        textLabel.font = UIFont(name: "Lato-Light", size: CGFloat(Float(18).getHeightWithCorrectRatio()))
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()
    
    fileprivate lazy var collectionTitleTextLabel : UILabel = {
        let textLabel  = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints =  false
        textLabel.contentMode = .scaleAspectFit
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        textLabel.font = UIFont(name: "Lato-Light", size: CGFloat(Float(18).getHeightWithCorrectRatio()))
        return textLabel
    }()
    
    fileprivate lazy var totalInventoryTextLabel : UILabel = {
        let textLabel  = UILabel(frame: .zero)
        textLabel.translatesAutoresizingMaskIntoConstraints =  false
        textLabel.contentMode = .scaleAspectFit
        textLabel.font = UIFont(name: "Lato-Light", size: CGFloat(Float(18).getHeightWithCorrectRatio()))
        textLabel.numberOfLines = 0
        textLabel.adjustsFontSizeToFitWidth = true
        return textLabel
    }()
    
    var productDetailViewModel : ProductDetailViewModel?{
        
        didSet{
            guard let collectionName = productDetailViewModel?.collectionTitle,
                let productName = productDetailViewModel?.productName,
                let inventoryCount = productDetailViewModel?.totalInventory,
                let urlString = productDetailViewModel?.collectionImageUrl  else{return}
            
            self.collectionTitleTextLabel.text = collectionName
            self.productNameTextLabel.text = productName
            self.totalInventoryTextLabel.text = "Total: \(String(inventoryCount))"
            self.myImageView.loadImageWithCache(urlString: urlString)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        initCode()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initCode(){
        
        backgroundColor =  UIColor.lightGray.withAlphaComponent(0.1)
        
        self.addSubview(myImageView)
        self.addSubview(productNameTextLabel)
        self.addSubview(collectionTitleTextLabel)
        self.addSubview(totalInventoryTextLabel)
        
        addConstraintsForImageview()
        
        addConstraintsForCollectionTitleLabel()
        
        addConstraintsForProductNameLabel()
        
        addConstraintsForTotalInventoryTextLabel()
    }
    
    fileprivate func addConstraintsForImageview() {
        myImageView.heightAnchor.constraint(equalToConstant: CGFloat(Float(100).getHeightWithCorrectRatio())).isActive =  true
        myImageView.widthAnchor.constraint(equalToConstant: CGFloat(Float(100).getWidthWithCorrectRatio())).isActive =  true
        myImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive =  true
        myImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive =  true
        myImageView.layer.cornerRadius = CGFloat(Float(50).getWidthWithCorrectRatio())
    }
    
    fileprivate func addConstraintsForCollectionTitleLabel() {
        collectionTitleTextLabel.leftAnchor.constraint(equalTo: myImageView.rightAnchor, constant: CGFloat(Float(7).getWidthWithCorrectRatio())).isActive = true
        collectionTitleTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive =  true
        collectionTitleTextLabel.heightAnchor.constraint(equalToConstant: CGFloat(Float(30).getHeightWithCorrectRatio())).isActive = true
        collectionTitleTextLabel.bottomAnchor.constraint(equalTo: productNameTextLabel.topAnchor, constant: CGFloat(Float(-5).getHeightWithCorrectRatio())).isActive = true
    }
    
    fileprivate func addConstraintsForProductNameLabel() {
        productNameTextLabel.leftAnchor.constraint(equalTo: collectionTitleTextLabel.leftAnchor, constant: 0).isActive = true
        productNameTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive =  true
        productNameTextLabel.heightAnchor.constraint(equalTo: collectionTitleTextLabel.heightAnchor).isActive = true
        productNameTextLabel.centerYAnchor.constraint(equalTo: myImageView.centerYAnchor, constant: 0).isActive = true
    }
    
    fileprivate func addConstraintsForTotalInventoryTextLabel() {
        totalInventoryTextLabel.leftAnchor.constraint(equalTo: collectionTitleTextLabel.leftAnchor, constant: 0).isActive = true
        totalInventoryTextLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive =  true
        totalInventoryTextLabel.heightAnchor.constraint(equalTo: productNameTextLabel.heightAnchor).isActive = true
        totalInventoryTextLabel.topAnchor.constraint(equalTo: productNameTextLabel.bottomAnchor, constant: CGFloat(Float(5).getHeightWithCorrectRatio())).isActive = true
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
