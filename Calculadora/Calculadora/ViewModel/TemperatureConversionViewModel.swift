//
//  TemperatureConversionViewModel.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 09/05/24.
//

import Foundation

class TemperatureConversionViewModel {
    
    // MARK: - Public Methods
    
    func convertTemperature(from sourceUnit: TemperatureUnit, temperature: Double) -> (celsius: Double, fahrenheit: Double, kelvin: Double) {
        var celsius: Double = 0
        var fahrenheit: Double = 0
        var kelvin: Double = 0
        
        switch sourceUnit {
        case .celsius:
            celsius = temperature
            fahrenheit = celsius * 9 / 5 + 32
            kelvin = celsius + 273.15
        case .fahrenheit:
            fahrenheit = temperature
            celsius = (fahrenheit - 32) * 5 / 9
            kelvin = celsius + 273.15
        case .kelvin:
            kelvin = temperature
            celsius = kelvin - 273.15
            fahrenheit = celsius * 9 / 5 + 32
        }
        
        return (celsius, fahrenheit, kelvin)
    }
}
