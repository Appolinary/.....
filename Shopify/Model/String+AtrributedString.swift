//
//  String+AtrributedString.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-07.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation
import UIKit

extension String {
    /*
     -helps to makes it easy to bolden some parts of a string but not the whole string.
     -can also bolden the whole string if 'boldString' is equal to the string itself
     */
    func attributedText(withBold boldString: String, font : UIFont) -> NSAttributedString {
        
        let attributedString = NSMutableAttributedString(string: self,
                                                         attributes: [NSAttributedStringKey.font: font])
        let boldFontAttribute: [NSAttributedStringKey: Any] = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        let range = (self as NSString).range(of: boldString)
        attributedString.addAttributes(boldFontAttribute, range: range)
        return attributedString
    }
}
