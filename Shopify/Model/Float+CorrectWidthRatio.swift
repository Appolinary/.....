//
//  Float+CorrectWidthRatio.swift
//  Shopify
//
//  Created by Fabrice Appolinary on 2019-01-08.
//  Copyright © 2019 Fabrice Appolinary. All rights reserved.
//

import Foundation
import Foundation
import UIKit
/*The ratio is based on the iPhone 8 screen size
 * ie height = 736.0
 *    width = 414
 */

extension Float{
    
    func getWidthWithCorrectRatio() -> Float{
        
        let width = min(Float(UIScreen.main.bounds.width) , Float(UIScreen.main.bounds.height))

        return self/CONSTANTS.GLOBAL_SCREEN_WIDTH * width
    }
}
