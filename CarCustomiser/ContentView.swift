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
    @State private var time=500.00
    
    func startTimer() {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true){_ in
            if time>0.001{
                time-=0.01
            }
            }
    }
        
    var exhaustPakageEnabled:Bool{
        return exhaustPakage ? false : remainingFunds >= 500 ? false : true
    }
    var tiresPakageEnabled:Bool{
        return tiresPakage ? false : remainingFunds >= 500 ? false : true
    }
    var suspentionPakageEnabled:Bool{
        return suspentionPakage ? false : remainingFunds >= 500 ? false : true
    }
    var nitroPakageEnabled:Bool{
        return nitroPakage ? false : remainingFunds >= 750 ? false : true
    }
    var body: some View {
        
        let exhaustPakageBinding = Binding<Bool>(
            get: {self.exhaustPakage},
            set: {newValue in
                if time>0.001{
                self.exhaustPakage=newValue
                    if newValue==true{
                        starterCars.cars[selectedCar].exhaustOn()
                        remainingFunds-=500
                    } else{
                        starterCars.cars[selectedCar].exhaustOff()
                        remainingFunds+=500
                    }
                }
                
            }
        )
        let tiresPakageBinding = Binding<Bool>(
            get: {self.tiresPakage},
            set: {newValue in
                if time>0.001{
                self.tiresPakage=newValue
                    if newValue==true{
                        starterCars.cars[selectedCar].tiresOn()
                        remainingFunds-=500
                    } else{
                        starterCars.cars[selectedCar].tiresOff()
                        remainingFunds+=500
                    }
                }
            }
        )
        let nitroPakageBinding = Binding<Bool>(
            get: {self.nitroPakage},
            set: {newValue in
                if time>=0.001{
                    self.nitroPakage=newValue
                    if newValue==true{
                        starterCars.cars[selectedCar].nitroOn()
                        remainingFunds-=750
                    } else{
                        starterCars.cars[selectedCar].nitroOff()
                        remainingFunds+=750
                    }
                }
                
            }
        )
        let suspentionPakageBinding = Binding<Bool>(
            get: {self.suspentionPakage},
            set: {newValue in
                if time>=0.001{
                self.suspentionPakage=newValue
                    if newValue==true{
                        
                            starterCars.cars[selectedCar].suspentionOn()
                            remainingFunds-=500
                        
                        
                    } else{
                        starterCars.cars[selectedCar].suspentionOff()
                        remainingFunds+=500
                    }
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
                        .disabled(exhaustPakageEnabled)
                    Toggle("Tires pakage (Cost:500)", isOn: tiresPakageBinding)
                        .disabled(tiresPakageEnabled)
                    Toggle("Suspention pakage (Cost:500)", isOn: suspentionPakageBinding)
                        .disabled(suspentionPakageEnabled)
                    Toggle("Nitro pakage (Cost:750)", isOn: nitroPakageBinding)
                        .disabled(nitroPakageEnabled)
                    
                }
                
                Text("Remaining Funds: \(remainingFunds)")
                    .foregroundColor(.red)
                    .baselineOffset(20)
                
                Text("Remaining time: \(String(format:"%.2f",time)) seconds")
                
            }
            
        }
        .onAppear {
            startTimer()
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
