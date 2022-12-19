//
//  Jewelery.swift
//  apiJsonParsingTask1
//
//  Created by Mac on 21/11/22.
//

import Foundation
struct Jewelery{
    var Id : Int
    var title : String
    var price : Double
    var description : String
    var category : String
    var image1 : String
    var rating : Rating

}

struct Rating{
        var rate : Double
        var count : Double
    }

