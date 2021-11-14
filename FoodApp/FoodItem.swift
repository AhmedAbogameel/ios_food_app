//
//  FoodItem.swift
//  FoodApp
//
//  Created by Jemi on 14/11/2021.
//

import Foundation
import UIKit

class FoodItem {
    
    var name:String?
    var image:String?
    var desc:String?
    
    init(name:String, image:String, desc:String){
        self.image = image
        self.name = name
        self.desc = desc
    }
    
}
