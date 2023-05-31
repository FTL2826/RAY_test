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
    
    init(vm: MainPageViewModelProtocol) {
        self.vm = vm
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        mainView.submitButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
    
    @objc private func buttonPressed() {
        mainView.textField.resignFirstResponder()
        guard let text = mainView.textField.text else { return }
        let result = vm.submitPressed(text)
        
        switch result {
        case .success(let url):
            vm.dowloadPicture(from: url)
        case .failure(let failure):
            let ac = UIAlertController(
                title: "Error ocurred!",
                message: "Please try again. \nError: \(failure.localizedDescription)",
                preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "Ok", style: .default))
            present(ac, animated: true)
        }
    }


}

