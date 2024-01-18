//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Raife Armstrong on 18/1/24.
//

import SwiftUI

struct ContentView: View {
    let car = Car(make:"Mazda", model:"MX-5", topSpeed:125, acceleration:7.7,handling:5)
    

    
    var body: some View {
        
        Text(car.statsPage())
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
