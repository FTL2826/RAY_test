//
//  MainPageVC.swift
//  RAY
//
//  Created by Александр Харин on /295/23.
//

import UIKit

class MainPageVC: UIViewController {
    
    let mainView = MainPageView()
    let vm: MainPageViewModelProtocol
    
    let alertTitle: String = "Error ocurred!"
    
    init(vm: MainPageViewModelProtocol) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        mainView.submitButton.addTarget(self, action: #selector(submitButtonPressed), for: .touchUpInside)
        mainView.favoriteButton.addTarget(self, action: #selector(favoriteButtonPressed), for: .touchUpInside)
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        bindVM()
    }
    
    private func bindVM() {
        vm.pictureData.bind {[weak self] data in
            DispatchQueue.main.async {
                self?.mainView.imageView.image = UIImage(data: data)
                self?.mainView.favoriteButton.isEnabled = true
                self?.mainView.favoriteButton.layer.backgroundColor = #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1).cgColor
            }
        }
        
        vm.networkError.bind {[weak self] error in
            guard let title = self?.alertTitle else { return }
            let message = "Please try again. \nError: \(error.localizedDescription)"
            self?.showAlert(with: title, and: message)
        }
    }
    
    private func showAlert(with title: String, and message: String) {
        let ac = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Ok", style: .default))
        present(ac, animated: true)
    }
    
    @objc private func favoriteButtonPressed() {
        vm.addFavorite()
    }
    
    @objc private func submitButtonPressed() {
        mainView.textField.resignFirstResponder()
        guard let text = mainView.textField.text else { return }
        let result = vm.submitPressed(text)
        
        switch result {
        case .success(let url):
            vm.dowloadPicture(from: url, with: text)
        case .failure(let failure):
            let title = alertTitle
            let message = "Please try again. \nError: \(failure.localizedDescription)"
            showAlert(with: title, and: message)
        }
    }
    


}


