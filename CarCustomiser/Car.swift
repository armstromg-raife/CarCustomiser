//
//  Car.swift
//  CarCustomiser
//
//  Created by Raife Armstrong on 18/1/24.
//

import Foundation

struct Car {
    let make:String
    let model:String
    var topSpeed:Int
    var acceleration:Double
    var handling:Int
    
    func statsPage() -> String{
        return("""
               Make: \(make)
               Model: \(model)
               Top Speed: \(topSpeed)mph
               Acceleration (0-60): \(acceleration)s
               Handling: \(handling)
               """)
    }
}
