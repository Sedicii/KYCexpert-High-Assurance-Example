//
//  ViewController.swift
//  KagiiKYCIntegration
//
//  Copyright © 2020 Sedicii Innovations Limited. All rights reserved.
//

import UIKit
import KYCExpert
import Kagii

class ViewController: UIViewController {

    let resultLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    let startButton: UIButton = {
        let button = UIButton()
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = Asset.secondary.color
        button.setTitle("Start Sedicii SDK", for: .normal)
        button.addTarget(self, action: #selector(startTouched(_:)), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
    }

    @objc private func startTouched(_ sender: UIButton) {
        KYCExpert.appearance = ClientAppearance.appearance
        Kagii.userInterface.logInUser { kagiiResult in
            switch kagiiResult {
            case .failure(let error):
                self.showErrorAlert(message: error.localizedDescription)
            case .success(let response):
                KYCExpert.startKYC(code: response.code) { kycResult in
                    switch kycResult {
                    case .failure(let error):
                        self.showErrorAlert(message: error.localizedDescription)
                    case .success:
                        break
                    }
                }
            }
        }
    }

    private func setupUI() {
        view.backgroundColor = .white
        view.addSubview(startButton)
        view.addSubview(resultLabel)

        setupConstraints()
    }

    private func setupConstraints() {
        startButton.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            startButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            startButton.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 200),

            resultLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 32),
            resultLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -32),
            resultLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -32)
        ])
    }

    private func showErrorAlert(message: String) {
        let alertController = UIAlertController(
            title: "Error", message: message, preferredStyle: .alert
        )
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        alertController.addAction(okAction)
        present(alertController, animated: true)
    }

}
