//
//  ContentView.swift
//  LengthConverter
//
//  Created by Soo Hwan Kim on 2022/02/06.
//

import SwiftUI

struct ContentView: View {
    @State private var inputUnit = "meters"
    @State private var outputUnit = "feet"
    @State private var inputValue = 0
    var outputValue = 0

    let lengthOptions = ["meters", "km", "feet", "yards", "miles"]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker("Choose input unit", selection: $inputUnit) {
                        ForEach(lengthOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Input Unit")
                }

                Section {
                    Picker("Choose output unit", selection: $outputUnit) {
                        ForEach(lengthOptions, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                } header: {
                    Text("Output Unit")
                }
                
                Section {
                    TextField("Input Value", value: $inputValue, format: .number)
                } header: {
                    Text("Input Value")
                }
                
                Section {
                    Text(outputValue, format: .number)
                } header: {
                    Text("Output Value")
                }
            }
            .navigationTitle("Length Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
