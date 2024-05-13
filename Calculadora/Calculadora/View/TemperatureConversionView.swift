//
//  TemperatureConversionView.swift
//  Calculadora
//
//  Created by Cabral Costa, Eduardo on 09/05/24.
//

import UIKit

class TemperatureConversionView: UIView {
    
    // MARK: - Properties
    
    let viewModel: TemperatureConversionViewModel

    let celsiusLabel: UILabel = {
        let label = UILabel()
        label.text = "Celsius"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let celsiusTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()


    let fahrenheitLabel: UILabel = {
        let label = UILabel()
        label.text = "Fahrenheit"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let fahrenheitTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    let kelvinLabel: UILabel = {
        let label = UILabel()
        label.text = "Kelvin"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let kelvinTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "0"
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()

    
    
    // MARK: - Initialization
    
    init(viewModel: TemperatureConversionViewModel) {
        self.viewModel = viewModel
        
        super.init(frame: .zero)
        
        backgroundColor = .white
        
        celsiusTextField.addTarget(self, action: #selector(updateFields(_:)), for: .editingChanged)
        fahrenheitTextField.addTarget(self, action: #selector(updateFields(_:)), for: .editingChanged)
        kelvinTextField.addTarget(self, action: #selector(updateFields(_:)), for: .editingChanged)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Setup
    
    private func setupUI() {
        addSubview(celsiusLabel)
        addSubview(celsiusTextField)
        addSubview(fahrenheitLabel)
        addSubview(fahrenheitTextField)
        addSubview(kelvinLabel)
        addSubview(kelvinTextField)
        
        NSLayoutConstraint.activate([
            celsiusLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            celsiusLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            celsiusTextField.topAnchor.constraint(equalTo: celsiusLabel.bottomAnchor, constant: 8),
            celsiusTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            celsiusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            fahrenheitLabel.topAnchor.constraint(equalTo: celsiusTextField.bottomAnchor, constant: 20),
            fahrenheitLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            fahrenheitTextField.topAnchor.constraint(equalTo: fahrenheitLabel.bottomAnchor, constant: 8),
            fahrenheitTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            fahrenheitTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            kelvinLabel.topAnchor.constraint(equalTo: fahrenheitTextField.bottomAnchor, constant: 20),
            kelvinLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            kelvinTextField.topAnchor.constraint(equalTo: kelvinLabel.bottomAnchor, constant: 8),
            kelvinTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            kelvinTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            kelvinTextField.bottomAnchor.constraint(lessThanOrEqualTo: safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
    }
    
    // MARK: - Public Methods
    
    @objc private func updateFields(_ textField: UITextField) {
        guard let sourceText = textField.text, let temperature = Double(sourceText) else { return }
        
        var sourceUnit: TemperatureUnit
        
        switch textField {
        case celsiusTextField:
            sourceUnit = .celsius
        case fahrenheitTextField:
            sourceUnit = .fahrenheit
        case kelvinTextField:
            sourceUnit = .kelvin
        default:
            return
        }
        
        let (convertedCelsius, convertedFahrenheit, convertedKelvin) = viewModel.convertTemperature(from: sourceUnit, temperature: temperature)
        
        celsiusTextField.text = "\(convertedCelsius)"
        fahrenheitTextField.text = "\(convertedFahrenheit)"
        kelvinTextField.text = "\(convertedKelvin)"
    }

}
