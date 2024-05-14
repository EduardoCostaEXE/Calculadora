//
//  PercentageCalculatorViewModel.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 14/05/24.
//

import UIKit

class PercentageCalculatorViewModel {
    
    // MARK: - Properties
    
    var result: Double = 0
    
    // MARK: - Public Methods
    
    func calculatePercentage(amount: Double, percentage: Double) {
        result = amount * percentage / 100.0
    }
}
