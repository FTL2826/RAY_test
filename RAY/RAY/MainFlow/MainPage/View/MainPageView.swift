//
//  MainPageView.swift
//  RAY
//
//  Created by Alex Kharin on 5/30/23.
//

import UIKit

final class MainPageView: UIView {
    lazy var textField: UITextField = {
        let tf = UITextField()
        tf.placeholder = "Query"
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 1)
        tf.layer.cornerRadius = 16
        tf.layer.borderColor = UIColor.gray.cgColor
        tf.layer.borderWidth = 1
        tf.keyboardType = .URL
        tf.autocorrectionType = .no
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 40))
        tf.leftView = padding
        tf.leftViewMode = .always
        tf.becomeFirstResponder()
        return tf
    }()
    lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Submit", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.layer.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1).cgColor
        btn.layer.cornerRadius = 16
        return btn
    }()
    lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 15
        iv.layer.shadowRadius = 5
        iv.layer.shadowColor = UIColor.black.cgColor
        iv.layer.shadowOpacity = 50
        return iv
    }()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func dismissKeyboard() {
        self.endEditing(true)
    }
    
    private func setupUI() {
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard)))
        
        addSubview(textField)
        addSubview(submitButton)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 30),
            textField.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40),
            
            submitButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: textField.leadingAnchor),
            submitButton.trailingAnchor.constraint(equalTo: textField.trailingAnchor),
            submitButton.heightAnchor.constraint(equalToConstant: 40),
            
            imageView.topAnchor.constraint(equalTo: submitButton.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 350),
            imageView.heightAnchor.constraint(equalToConstant: 350),
        ])
    }

}
