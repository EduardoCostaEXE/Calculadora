//
//  PercentageCalculatorView.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 14/05/24.
//

import UIKit

class PercentageCalculatorView: UIView {
    
    // MARK: - Properties
    
    let viewModel: PercentageCalculatorViewModel
    
    let amountLabel: UILabel = {
        let label = UILabel()
        label.text = "Valor:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let amountTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o valor"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let percentageLabel: UILabel = {
        let label = UILabel()
        label.text = "Porcentagem:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let percentageTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite a porcentagem"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "Resultado:"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let calculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calcular", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(calculateButtonTapped(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Initialization
    
    init(viewModel: PercentageCalculatorViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        backgroundColor = .white
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(amountLabel)
        addSubview(amountTextField)
        addSubview(percentageLabel)
        addSubview(percentageTextField)
        addSubview(resultLabel)
        addSubview(calculateButton)
        
        NSLayoutConstraint.activate([
            amountLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            amountLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            amountTextField.topAnchor.constraint(equalTo: amountLabel.bottomAnchor, constant: 8),
            amountTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            amountTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            percentageLabel.topAnchor.constraint(equalTo: amountTextField.bottomAnchor, constant: 20),
            percentageLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            percentageTextField.topAnchor.constraint(equalTo: percentageLabel.bottomAnchor, constant: 8),
            percentageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            percentageTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            resultLabel.topAnchor.constraint(equalTo: percentageTextField.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            calculateButton.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20),
            calculateButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            calculateButton.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20),
            calculateButton.widthAnchor.constraint(equalToConstant: 120),
            calculateButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    // MARK: - Public Methods
    
    @objc private func calculateButtonTapped(_ sender: UIButton) {
        if !amountTextField.text!.isEmpty {
            amountTextField.layer.borderColor = UIColor.clear.cgColor
            amountTextField.layer.borderWidth = 0.0
        } else {
            amountTextField.layer.borderColor = UIColor.red.cgColor
            amountTextField.layer.borderWidth = 1.0
        }
        
        if !percentageTextField.text!.isEmpty {
            percentageTextField.layer.borderColor = UIColor.clear.cgColor
            percentageTextField.layer.borderWidth = 0.0
        } else {
            percentageTextField.layer.borderColor = UIColor.red.cgColor
            percentageTextField.layer.borderWidth = 1.0
        }
        
        if amountTextField.text!.isEmpty || percentageTextField.text!.isEmpty {
            return
        }
        
        guard let amount = Double(amountTextField.text!) else{
            return
        }
        guard let percentage = Double(percentageTextField.text!) else{
            return
        }
    
        viewModel.calculatePercentage(amount: amount, percentage: percentage)
        resultLabel.text = "Resultado: \(viewModel.result)"
    }
    
    private func verifyAmountField(){
        
    }
}
