//
//  BhaskaraCalculatorView.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 08/05/24.
//

import UIKit

class BhaskaraCalculatorView: UIView {
    
    // MARK: - Properties
    
    let resultLabel: UILabel
    let coefficientATextField: UITextField
    let coefficientBTextField: UITextField
    let coefficientCTextField: UITextField
    let calculateButton: UIButton
    
    // MARK: - Initialization
    
    override init(frame: CGRect) {
        resultLabel = UILabel()
        resultLabel.text = "x₁ = 0, x₂ = 0"
        resultLabel.textAlignment = .center
        resultLabel.font = UIFont.systemFont(ofSize: 18)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        coefficientATextField = UITextField()
        coefficientATextField.placeholder = "a"
        coefficientATextField.textAlignment = .center
        coefficientATextField.keyboardType = .decimalPad
        coefficientATextField.borderStyle = .roundedRect // Adiciona uma borda arredondada
        coefficientATextField.translatesAutoresizingMaskIntoConstraints = false
        
        coefficientBTextField = UITextField()
        coefficientBTextField.placeholder = "b"
        coefficientBTextField.textAlignment = .center
        coefficientBTextField.keyboardType = .decimalPad
        coefficientBTextField.borderStyle = .roundedRect // Adiciona uma borda arredondada
        coefficientBTextField.translatesAutoresizingMaskIntoConstraints = false
        
        coefficientCTextField = UITextField()
        coefficientCTextField.placeholder = "c"
        coefficientCTextField.textAlignment = .center
        coefficientCTextField.keyboardType = .decimalPad
        coefficientCTextField.borderStyle = .roundedRect // Adiciona uma borda arredondada
        coefficientCTextField.translatesAutoresizingMaskIntoConstraints = false
        
        calculateButton = UIButton()
        calculateButton.setTitle("Calcular", for: .normal)
        calculateButton.setTitleColor(.white, for: .normal)
        calculateButton.backgroundColor = .systemBlue
        calculateButton.layer.cornerRadius = 8
        calculateButton.translatesAutoresizingMaskIntoConstraints = false
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(resultLabel)
        addSubview(coefficientATextField)
        addSubview(coefficientBTextField)
        addSubview(coefficientCTextField)
        addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            coefficientATextField.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            coefficientATextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            coefficientATextField.widthAnchor.constraint(equalToConstant: 100),
            
            coefficientBTextField.topAnchor.constraint(equalTo: coefficientATextField.topAnchor),
            coefficientBTextField.leadingAnchor.constraint(equalTo: coefficientATextField.trailingAnchor, constant: 20),
            coefficientBTextField.widthAnchor.constraint(equalTo: coefficientATextField.widthAnchor),
            
            coefficientCTextField.topAnchor.constraint(equalTo: coefficientATextField.topAnchor),
            coefficientCTextField.leadingAnchor.constraint(equalTo: coefficientBTextField.trailingAnchor, constant: 20),
            coefficientCTextField.widthAnchor.constraint(equalTo: coefficientATextField.widthAnchor),
            
            calculateButton.topAnchor.constraint(equalTo: coefficientATextField.bottomAnchor, constant: 20),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.widthAnchor.constraint(equalToConstant: 120),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}

