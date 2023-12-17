//
//  ViewController.swift
//  TMSHomework-Lesson8
//
//  Created by Наталья Мазур on 12.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let completeDayButton = UIButton(type: .system)
    let revenueLabel = UILabel()
    let beerSoldVolumeLabel = UILabel()
    
    var buttonArray: [UIButton] = []
    var labelArray: [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCompleteDayButton()
        setupRevenueLabel()
        setupBuyButtonLabelPair()
        addSubviews()
    }
    
    func setupCompleteDayButton() {
        
        completeDayButton.setTitle("Завершить рабочий день", for: .normal)
        completeDayButton.setTitleColor(UIColor.systemBlue, for: .normal)
        completeDayButton.backgroundColor = UIColor.systemGray6
        completeDayButton.layer.cornerRadius = 7.0
        completeDayButton.translatesAutoresizingMaskIntoConstraints = false
        completeDayButton.addTarget(self, action: #selector(completeDayButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(completeDayButton)
        
        setupCompleteDayButtonConstraints(button: completeDayButton)
    }
    
    func setupRevenueLabel() {
        
        BeerManager.shared.checkTodayRevenue(label: revenueLabel)
        revenueLabel.textColor = UIColor.black
        revenueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(revenueLabel)
        
        setupRevenueLabelConstraints(label: revenueLabel)
    }
    
    func setupBeerSoldVolumeLabel() {
        
        beerSoldVolumeLabel.text = "Пива было продано: 999999L"
        beerSoldVolumeLabel.textColor = UIColor.black
        beerSoldVolumeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(beerSoldVolumeLabel)
        
        setupBeerSoldVolumeLabelConstraints(label: beerSoldVolumeLabel)
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
    
    func setupBuyButtonLabelPair() {
        
        var previousBuyButton: UIButton?
        var previousBuyLabel: UILabel?
        
        for title in createBuyButtonsArray() {
            let buyButton = UIButton(type: .system)
            
            buyButton.setTitle(title, for: .normal)
            buyButton.setTitleColor(UIColor.white, for: .normal)
            buyButton.titleLabel?.font = UIFont(name: "Helvetica Bold", size: 21.0)
            buyButton.layer.cornerRadius = 7.0
            buyButton.backgroundColor = UIColor.systemOrange
            buyButton.translatesAutoresizingMaskIntoConstraints = false
            buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
            
            buttonArray.append(buyButton)
            self.view.addSubview(buyButton)
            
            setupBuyButtonConstraints(button: buyButton, previousButton: previousBuyButton)
            
            previousBuyButton = buyButton
            
        }
        
        for text in BeerManager.shared.createBuyLabelsArray() {
            let buyLabel = UILabel()
            
            buyLabel.text = text
            buyLabel.textColor = UIColor.black
            buyLabel.font = UIFont(name: "Helvetica", size: 15.0)
            buyLabel.translatesAutoresizingMaskIntoConstraints = false
            buyLabel.numberOfLines = 2
            
            labelArray.append(buyLabel)
            self.view.addSubview(buyLabel)
            
            setupBuyLabelConstraints(label: buyLabel, previousLabel: previousBuyLabel)
            
            previousBuyLabel = buyLabel
            
        }
        
    }
    
    func setupBuyButtonConstraints(button: UIButton, previousButton: UIButton?) {
        button.snp.makeConstraints { make in
            if let previousButton = previousButton {
                make.top.equalTo(previousButton.snp.bottom).offset(20)
            } else {
                make.top.equalToSuperview().offset(200)
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
                make.top.equalToSuperview().offset(200)
            }
            make.left.equalTo(200)
            make.width.equalTo(140)
            make.height.equalTo(42)
        }
    }
    
    func setupCompleteDayButtonConstraints(button: UIButton) {
        button.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(570)
            make.left.equalTo(60)
            make.width.equalTo(240)
            make.height.equalTo(45)
        }
    }
    
    func setupRevenueLabelConstraints(label: UILabel) {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalTo(40)
            make.width.equalTo(240)
            make.height.equalTo(45)
        }
    }
    
    func setupBeerSoldVolumeLabelConstraints(label: UILabel) {
        label.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(150)
            make.left.equalTo(40)
            make.width.equalTo(240)
            make.height.equalTo(45)
        }
    }
    
    func addSubviews() {
        buttonArray.forEach { button in
            self.view.addSubview(button)
        }
        
        labelArray.forEach { label in
            self.view.addSubview(label)
        }
        
    }
    
    @objc func buyButtonTapped(button: UIButton) {
        if let index = buttonArray.firstIndex(where: { $0 == button }) {
            let labelText = labelArray[index]
            labelText.text = "\(BeerManager.shared.beerList[index].volume - 1)"
        }
    }
    

    
    @objc func completeDayButtonTapped() {
        BeerManager.shared.resetRevenue()
    }
    
}

