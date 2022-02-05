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
        if(inputUnit == "meters") {
            switch outputUnit {
            case "km":
                return inputValue / 1000
            case "feet":
                return inputValue * 3.281
            case "yards":
                return inputValue * 1.094
            case "miles":
                return inputValue / 1609
            default:
                return inputValue
            }
        } else if(inputUnit == "km") {
            switch outputUnit {
            case "meters":
                return inputValue * 1000
            case "feet":
                return inputValue * 3281
            case "yards":
                return inputValue * 1094
            case "miles":
                return inputValue / 1.609
            default:
                return inputValue
            }
        } else if (inputUnit == "feet") {
            switch outputUnit {
            case "meters":
                return inputValue / 3.281
            case "km":
                return inputValue / 3281
            case "yards":
                return inputValue / 3
            case "miles":
                return inputValue / 5280
            default:
                return inputValue
            }
        } else if (inputUnit == "yards") {
            switch outputUnit {
            case "meters":
                return inputValue / 1.094
            case "km":
                return inputValue / 1094
            case "feet":
                return inputValue * 3
            case "miles":
                return inputValue / 1760
            default:
                return inputValue
            }
        } else if (inputUnit == "miles") {
            switch outputUnit {
            case "meters":
                return inputValue * 1609
            case "km":
                return inputValue * 1.609
            case "feet":
                return inputValue * 5280
            case "yards":
                return inputValue * 1760
            default:
                return inputValue
            }
        }
         
        return inputValue
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
                    Text(outputValue, format: .number)
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
