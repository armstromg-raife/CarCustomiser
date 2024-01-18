//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by Raife Armstrong on 18/1/24.
//

import XCTest
@testable import CarCustomiser

final class CarCustomiserTests: XCTestCase {

    func testNewCarGivesMeACarWithAllAttirbutesSet(){
        //arange
        //act
        let car = Car(make:"Mazda", model:"MX-5", topSpeed:125, acceleration:7.7,handling:5)
        //assert
        XCTAssertEqual(car.make,"mazda")
        XCTAssertEqual(car.model,"MX-5")
        XCTAssertEqual(car.topSpeed,125)
        XCTAssertEqual(car.acceleration,7.7)
        XCTAssertEqual(car.handling,5)
    }
    
    func testDisplaysAllStats(){
        let car = Car(make:"Mazda", model:"MX-5", topSpeed:125, acceleration:7.7,handling:5)
        let stats=car.statsPage()
        XCTAssertEqual(stats,"""
                       Make: \(car.make)
                       Model: \(car.model)
                       Top Speed: \(car.topSpeed)mph
                       Acceleration (0-60): \(car.acceleration)s
                       Handling: \(car.handling)
                       """)
    }
    func testPerformanceExample() throws {
        // This is an example of a performance  case.
        self.measure {
            // Put the  you want to measure the time of here.
        }
    }

}
