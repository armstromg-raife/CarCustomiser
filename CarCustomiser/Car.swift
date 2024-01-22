//
//  Car.swift
//  CarCustomiser
//
//  Created by Raife Armstrong on 18/1/24.
//

import Foundation

struct Car {
    private let make:String
    private let model:String
    private var topSpeed:Int
    private var acceleration:Double
    private var handling:Int
    
    init(make: String, model: String, topSpeed: Int, acceleration: Double, handling: Int) {
        self.make = make
        self.model = model
        self.topSpeed = topSpeed
        self.acceleration = acceleration
        self.handling = handling
    }
    
    func statsPage() -> String{
        return("""
               Make: \(make)
               Model: \(model)
               Top Speed: \(topSpeed)mph
               Acceleration (0-60): \(acceleration)s
               Handling: \(handling)
               """)
    }
    mutating func exhaustOn(){
        topSpeed+=5
    }
    mutating func exhaustOff(){
        topSpeed-=5
    }
    mutating func tiresOn(){
        handling+=2
    }
    mutating func tiresOff(){
        handling-=2
    }
    mutating func nitroOn(){
        topSpeed+=10
    }
    mutating func nitroOff(){
        topSpeed-=10
    }
    mutating func suspentionOn(){
        handling+=2
    }
    mutating func suspentionOff(){
        handling-=2
    }
}
