//
//  Float+CorrectHeightRatio.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-08.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation
import UIKit
/*The ratio is based on the iPhone 8 screen size
 * ie height = 736.0
 *    width = 414
 */

extension Float{
    
    func getHeightWithCorrectRatio() -> Float{
        
        let height = max(Float(UIScreen.main.bounds.width) , Float(UIScreen.main.bounds.height))
        
        return self/CONSTANTS.GLOBAL_SCREEN_HEIGHT * height
    }
}
