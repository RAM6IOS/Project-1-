//
//  ContentView.swift
//  Project 1
//
//  Created by MAC on 9/5/2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var checkAmount = ""
    @State private var numberOfPeople = ""
    @State private var tipPercentage = 0
    let students = ["Harry", "Hermione", "Ron"]
    let tipPercentages = [10, 15, 20, 25, 0]
    var totalPerPerson: Double {
        let peopleCount = Double(Int(numberOfPeople) ?? 1 + 2)
        let tipSelection = Double(tipPercentages[tipPercentage])
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        return amountPerPerson
        

    }
    var Totalamount: Double {
        let tipSelection = Double(tipPercentages[tipPercentage])
        let stringValue = "0.5"
        let doubleValue = Double(stringValue)
        let orderAmount = Double(checkAmount) ?? 0
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        return grandTotal
        

    }
    
    var body: some View {
        NavigationView{
        Form{
            
            Section{
                TextField("username", text:$checkAmount)
                    .keyboardType(.decimalPad)
                
                Picker("username",selection:$numberOfPeople){
                    ForEach( 1 ..< 20) {
                        Text("\($0)people")
                    }
                    .keyboardType(.decimalPad)
                    
                }
            }
            Section(header: Text("How much tip do you want to leave?")) {
                Picker("Tip percentage", selection: $tipPercentage) {
                    ForEach(0 ..< tipPercentages.count) {
                        Text("\(self.tipPercentages[$0])%")
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }
            
            
            Section(header: Text("Amount per person")){
                Text("\(totalPerPerson , specifier: "%.2f")")
            }
            
            Section(header: Text("Total amount for the check")){
                
                Text("\(Totalamount ,specifier: "%.2f" )")
            }
                    
                    
                
                   
               

            
        }
        
        .navigationBarTitle("SWIFTUI")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
