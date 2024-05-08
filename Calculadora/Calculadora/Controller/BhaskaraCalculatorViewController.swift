//
//  BhaskaraCalculatorViewController.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 07/05/24.
//

import UIKit

class BhaskaraCalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    private var calculatorView: BhaskaraCalculatorView!
    private var calculatorViewModel: BhaskaraCalculatorViewModel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calculadora de Bhaskara"
        view.backgroundColor = .white
        setupViewModel()
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupViewModel() {
        calculatorViewModel = BhaskaraCalculatorViewModel()
    }
    
    private func setupView() {
        calculatorView = BhaskaraCalculatorView()
        calculatorView.translatesAutoresizingMaskIntoConstraints = false
        calculatorView.backgroundColor = .white
        calculatorView.calculateButton.addTarget(self, action: #selector(calculateButtonTapped), for: .touchUpInside)
        view.addSubview(calculatorView)
        
        NSLayoutConstraint.activate([
            calculatorView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            calculatorView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            calculatorView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            calculatorView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func calculateButtonTapped() {
        let coefficientA = Double(calculatorView.coefficientATextField.text ?? "") ?? 0
        let coefficientB = Double(calculatorView.coefficientBTextField.text ?? "") ?? 0
        let coefficientC = Double(calculatorView.coefficientCTextField.text ?? "") ?? 0
        
        let (x1, x2) = calculatorViewModel.calculateBhaskara(a: coefficientA, b: coefficientB, c: coefficientC)
        
        calculatorView.resultLabel.text = "x₁ = \(x1 ?? 0), x₂ = \(x2 ?? 0)"
    }
}
