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
    @State private var inputValue = 0.0
    @FocusState private var inputValueIsFocused: Bool
    
    var outputValue: Double {
        switch inputUnit {
        case "meters":
            return convertMetersToOutputUnit(inputValue)
        case "km":
            return convertMetersToOutputUnit(inputValue * 1000)
        case "feet":
            return convertMetersToOutputUnit(inputValue / 3.281)
        case "yards":
            return convertMetersToOutputUnit(inputValue / 1.094)
        case "miles":
            return convertMetersToOutputUnit(inputValue * 1609)
        default:
            return inputValue
        }
    }
    
    func convertMetersToOutputUnit(_ meters: Double) -> Double {
        switch outputUnit {
        case "km":
            return meters / 1000
        case "feet":
            return meters * 3.281
        case "yards":
            return meters * 1.094
        case "miles":
            return meters / 1609
        default:
            return meters
        }
    }
    
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
                        .keyboardType(.numberPad)
                        .focused($inputValueIsFocused)
                } header: {
                    Text("Input Value")
                }
                
                Section {
                    Text(outputValue.formatted())
                } header: {
                    Text("Output Value")
                }
            }
            .navigationTitle("Length Converter")
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    
                    Button("Done") {
                        inputValueIsFocused = false
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
