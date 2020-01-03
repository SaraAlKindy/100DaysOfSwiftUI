//
//  ContentView.swift
//  UnitConversion
//
//  Created by Sara Al-Kindy on 2019-12-20.
//  Copyright © 2019 Sara Al-Kindy. All rights reserved.
//

import SwiftUI

//kilogram ouncs stone pound grame

struct ContentView: View {
    
    @State private var kilogram = ""
    
    
    var gram: Double {
        let kgDouble = Double(kilogram) ?? 0
        return kgDouble * 100
    }
    
    var pound: Double {
        let kgDouble = Double(kilogram) ?? 0
        return kgDouble * 2.20462
    }
    
    var ounce: Double {
        let kgDouble = Double(kilogram) ?? 0
        return kgDouble * 35.274
    }
    
    var stone: Double {
        let kgDouble = Double(kilogram) ?? 0
        return kgDouble / 6.35

    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter weight in kilogram")) {
                    TextField("Amount", text: $kilogram)
                    .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Weight in grams")) {
                    Text("\(gram, specifier: "%.0f")" )
                }
                
                Section(header: Text("Weight in pounds")) {
                    Text("\(pound, specifier: "%.2f")")
                }
                
                Section(header: Text("Weight in ounces")) {
                    Text("\(ounce, specifier: "%.2f")")
                }
                
                Section(header: Text("Weight in stones")) {
                    Text("\(stone, specifier: "%.2f")")
                }
            }.navigationBarTitle("Weight Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
