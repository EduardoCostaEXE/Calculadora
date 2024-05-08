//
//  BhaskaraCalculatorViewModel.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 08/05/24.
//

import Foundation

class BhaskaraCalculatorViewModel {
    
    // MARK: - Properties
    
    private var a: Double = 0
    private var b: Double = 0
    private var c: Double = 0
    
    // MARK: - Public Methods
    
    func calculateBhaskara(a: Double, b: Double, c: Double) -> (x1: Double?, x2: Double?) {
        let delta = b * b - 4 * a * c
        
        if delta < 0 {
            return (nil, nil)
        } else if delta == 0 {
            let x = -b / (2 * a)
            return (x, nil)
        } else {
            let x1 = (-b + sqrt(delta)) / (2 * a)
            let x2 = (-b - sqrt(delta)) / (2 * a)
            return (x1, x2)
        }
    }
}
