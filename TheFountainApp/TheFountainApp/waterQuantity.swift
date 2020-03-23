//
//  waterQuantity.swift
//  TheFountainApp
//
//  Created by lfbp on 10/03/20.
//  Copyright © 2020 lfbp. All rights reserved.
//

import Foundation

class waterQuantity {
    
    var qInLiters:float_t
    var qInLGallons:float_t
    let litersToGallons:float_t
    let gallonsToLiters:float_t
    
    init(qInLiters:float_t, qInGallons:float_t) {
        self.qInLiters = qInLiters
        self.qInLGallons = qInGallons
        self.litersToGallons = 1.0/20
        self.gallonsToLiters = 20
    }
    
    func GallonsToLiters() -> float_t {
        
        self.qInLiters = self.qInLGallons * self.gallonsToLiters
        return self.qInLiters
    }
    
    func LitersToGallons() -> float_t {
               
        self.qInLGallons = self.qInLiters * self.litersToGallons
               return self.qInLiters
    }
    
    func Total(peopleNumber:String,waterRatial:String) -> float_t{
        var total:float_t
        let peopleFloat = Float(peopleNumber)
        let waterRatialFloat =  Float(waterRatial)
        total = peopleFloat! * waterRatialFloat!
        return total
    }
}
