//
//  ViewController.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 07/05/24.
//

import UIKit

class BasicCalculatorViewController: UIViewController {
    
    // MARK: - Properties
    
    private var resultLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Calculadora Básica"
        
        setupUI()
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        resultLabel = UILabel()
        resultLabel.text = "0"
        resultLabel.textAlignment = .right
        resultLabel.font = UIFont.systemFont(ofSize: 36)
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(resultLabel)
        
        NSLayoutConstraint.activate([
            resultLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        let buttons: [[String]] = [
            ["7", "8", "9", "+"],
            ["4", "5", "6", "-"],
            ["1", "2", "3", "x"],
            ["C", "0", "=", "/"]
        ]
        
        var previousButton: UIView?
        
        for row in buttons {
            let stackView = UIStackView()
            stackView.axis = .horizontal
            stackView.spacing = 10
            stackView.distribution = .fillEqually
            stackView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(stackView)
            
            for buttonTitle in row {
                let button = UIButton()
                button.setTitle(buttonTitle, for: .normal)
                button.setTitleColor(.black, for: .normal)
                button.titleLabel?.font = UIFont.systemFont(ofSize: 24)
                button.backgroundColor = .lightGray
                button.layer.cornerRadius = 8
                button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
                button.translatesAutoresizingMaskIntoConstraints = false
                stackView.addArrangedSubview(button)
                
                NSLayoutConstraint.activate([
                    button.heightAnchor.constraint(equalToConstant: 60)
                ])
            }
            
            NSLayoutConstraint.activate([
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
            ])
            
            if let previousButton = previousButton {
                NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: previousButton.bottomAnchor, constant: 20)
                ])
            } else {
                NSLayoutConstraint.activate([
                    stackView.topAnchor.constraint(equalTo: resultLabel.bottomAnchor, constant: 20)
                ])
            }
            
            previousButton = stackView
        }
    }
    
    // MARK: - Actions
    
    @objc private func buttonTapped(_ sender: UIButton) {
        guard let title = sender.title(for: .normal) else { return }
        print("Button tapped: \(title)")
    }
}


