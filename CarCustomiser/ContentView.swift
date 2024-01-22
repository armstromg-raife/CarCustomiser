//
//  ContentView.swift
//  CarCustomiser
//
//  Created by Raife Armstrong on 18/1/24.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar: Int=0
    @State private var exhaustPakage = false
    @State private var tiresPakage = false
    @State private var nitroPakage = false
    @State private var suspentionPakage = false
    @State private var remainingFunds: Int = 1000

    var funds5:Bool{
        if remainingFunds>=500{
            return false
        }else{
            return true
        }
    }
    var funds75:Bool{
        if remainingFunds>=750{
            return false
        }else{
            return true
        }
    }
    
    var body: some View {
        let exhaustPakageBinding = Binding<Bool>(
            get: {self.exhaustPakage},
            set: {newValue in
                self.exhaustPakage=newValue
                if newValue==true{
                    if remainingFunds>=500{
                        starterCars.cars[selectedCar].exhaustOn()
                        remainingFunds-=500
                    }else{
                        exhaustPakage=false
                    }
                } else{
                    starterCars.cars[selectedCar].exhaustOff()
                    remainingFunds+=500
                }
                
            }
        )
        let tiresPakageBinding = Binding<Bool>(
            get: {self.tiresPakage},
            set: {newValue in
                self.tiresPakage=newValue
                if newValue==true{
                    if remainingFunds>=500{
                        starterCars.cars[selectedCar].tiresOn()
                        remainingFunds-=500
                    }else{
                        tiresPakage=false
                    }
                } else{
                    starterCars.cars[selectedCar].tiresOff()
                    remainingFunds+=500
                }
                
            }
        )
        let nitroPakageBinding = Binding<Bool>(
            get: {self.nitroPakage},
            set: {newValue in
                self.nitroPakage=newValue
                if newValue==true{
                    if remainingFunds>=750{
                        starterCars.cars[selectedCar].nitroOn()
                        remainingFunds-=750
                    }else{
                        nitroPakage=false
                    }
                } else{
                    starterCars.cars[selectedCar].nitroOff()
                    remainingFunds+=750
                }
                
            }
        )
        let suspentionPakageBinding = Binding<Bool>(
            get: {self.suspentionPakage},
            set: {newValue in
                self.suspentionPakage=newValue
                if newValue==true{
                    if remainingFunds>=500{
                        starterCars.cars[selectedCar].suspentionOn()
                        remainingFunds-=500
                    }else{
                        suspentionPakage=false
                    }
                } else{
                    starterCars.cars[selectedCar].suspentionOff()
                    remainingFunds+=500
                }
                
            }
        )
        VStack{
            Form {
                VStack(alignment: .leading,spacing:20){
                    Text("\(starterCars.cars[selectedCar].statsPage())")
                    Button("Next car") {
                        
                        resetPage()

                        selectedCar=(selectedCar+1)%self.starterCars.cars.count
                    }
                }
                
                Section {
                    Toggle("Exhaust pakage (Cost:500)", isOn: exhaustPakageBinding)
                        //.disabled(funds5)
                    Toggle("Tires pakage (Cost:500)", isOn: tiresPakageBinding)
                        //.disabled(funds5)
                    Toggle("Suspention pakage (Cost:500)", isOn: suspentionPakageBinding)
                        //.disabled(funds5)
                    Toggle("Nitro pakage (Cost:750)", isOn: nitroPakageBinding)
                        //.disabled(funds75)
                    
                }
                
                Text("Remaining Funds: \(remainingFunds)")
                    .foregroundColor(.red)
                    .baselineOffset(20)
                
            }
        }
        
    }
    func resetPage(){
        if exhaustPakage{
            starterCars.cars[selectedCar].exhaustOff()
            exhaustPakage=false
        }
        if tiresPakage{
            starterCars.cars[selectedCar].tiresOff()
            tiresPakage=false
        }
        if suspentionPakage{
            starterCars.cars[selectedCar].suspentionOff()
            suspentionPakage=false
        }
        if nitroPakage{
            starterCars.cars[selectedCar].nitroOff()
            nitroPakage=false
        }
        remainingFunds=1000
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
