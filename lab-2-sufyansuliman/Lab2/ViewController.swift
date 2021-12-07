//
//  ViewController.swift
//  Lab2
//
//  Created by Shyam Kumar on 9/17/21.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "What's your name?"
        label.textColor = .black
        label.textAlignment = .center
        label.accessibilityIdentifier = "nameLabel"
        return label
    }()
    
    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.textAlignment = .center
        textField.accessibilityIdentifier = "nameText"
        return textField
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.accessibilityIdentifier = "enterButton"
        return button
    }()
    
    lazy var nameStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 10
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        stack.addArrangedSubview(label)
        stack.addArrangedSubview(textField)
        stack.addArrangedSubview(enterButton)
        return stack
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .white
        view.addSubview(nameStack)
        enterButton.addTarget(self, action: #selector(enterFunction), for: .touchUpInside)
        
        // TODO: - Add a target to enterButton
        // TODO: - Add nameStack to the view
    }
    
    func setupConstraints() {
        nameStack.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameStack.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        label.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 50).isActive = true
        nameStack.heightAnchor.constraint(equalToConstant: 130).isActive = true
    }
    
    // MARK: - Write a function to be called when the Enter button is tapped
    @objc func enterFunction() {
        if let ourStr = textField.text{
            let trimmed = ourStr.trimmingCharacters(in: .whitespacesAndNewlines)
            if trimmed == ""{
                return
            } else {
                label.text = "Hi, " + trimmed
            }
        }
    }
    /*
     Strip all of the spaces from textField.text, and set the label accordingly.
     
     If textField.text is "   ", DO NOT CHANGE THE LABEL
     If textField.text is "Test", set the label's text to "Hello, Test"
     https://www.hackingwithswift.com/example-code/strings/how-to-trim-whitespace-in-a-string
     */
}

