//
//  ViewController.swift
//  TMSHomework-Lesson8
//
//  Created by Наталья Мазур on 12.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    var buyLabelsArray = [UILabel]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBuyButton()
        setupBuyLabel()
        
    }
    
    func createBuyButtonsArray() -> [String] {
        var buyButtonTitles = [String]()
        var amountOfButtons = 6
        while amountOfButtons != 0 {
            buyButtonTitles.append("Купить")
            amountOfButtons -= 1
        }
        return buyButtonTitles
    }
    
    func setupBuyButton() {
        
        var previousBuyButton: UIButton?
        
        for title in createBuyButtonsArray() {
            let buyButton = UIButton(type: .system)
            
            buyButton.setTitle(title, for: .normal)
            buyButton.setTitleColor(UIColor.white, for: .normal)
            buyButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 21.0)
            buyButton.layer.cornerRadius = 7.0
            buyButton.backgroundColor = UIColor.systemOrange
            buyButton.translatesAutoresizingMaskIntoConstraints = false
            buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)

            self.view.addSubview(buyButton)
            
            setupBuyButtonConstraints(button: buyButton, previousButton: previousBuyButton)
            
            previousBuyButton = buyButton
        }
        
    }
    
    func setupBuyLabel() {
        
        var previousBuyLabel: UILabel?
        
        for text in BeerManager.shared.createBuyLabelsArray() {
            let buyLabel = UILabel()
            
            buyLabel.text = text
            buyLabel.textColor = UIColor.black
            buyLabel.font = UIFont(name: "Helvetica", size: 15.0)
            buyLabel.translatesAutoresizingMaskIntoConstraints = false
            buyLabel.numberOfLines = 2
            
            self.view.addSubview(buyLabel)
            buyLabelsArray.append(buyLabel)
            
            setupBuyLabelConstraints(label: buyLabel, previousLabel: previousBuyLabel)
            
            previousBuyLabel = buyLabel
        }
        
    }
    
    func setupBuyButtonConstraints(button: UIButton, previousButton: UIButton?) {
        button.snp.makeConstraints { make in
            if let previousButton = previousButton {
                make.top.equalTo(previousButton.snp.bottom).offset(20)
            } else {
                make.top.equalToSuperview().offset(220)
            }
            make.left.equalTo(40)
            make.width.equalTo(140)
            make.height.equalTo(42)
        }
    }
    
    func setupBuyLabelConstraints(label: UILabel, previousLabel: UILabel?) {
        label.snp.makeConstraints { make in
            if let previousLabel = previousLabel {
                make.top.equalTo(previousLabel.snp.bottom).offset(20)
            } else {
                make.top.equalToSuperview().offset(220)
            }
            make.left.equalTo(200)
            make.width.equalTo(140)
            make.height.equalTo(42)
        }
    }
    
    @objc func buyButtonTapped(_ sender: UIButton) {
        guard let index = sender.subviews.firstIndex(of: sender) else { return }
        let label = buyLabelsArray[index]
        label.text = "Button \(index + 1) was pressed"
    }
    
}

