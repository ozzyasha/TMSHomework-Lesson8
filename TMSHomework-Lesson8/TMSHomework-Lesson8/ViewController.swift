//
//  ViewController.swift
//  TMSHomework-Lesson8
//
//  Created by Наталья Мазур on 12.12.23.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    // MARK: - создание кнопок и лейблов
    let buyButton1 = UIButton(type: .system)
    let buyButton2 = UIButton(type: .system)
    let buyButton3 = UIButton(type: .system)
    let buyButton4 = UIButton(type: .system)
    
    let completeDayButton = UIButton(type: .system)
    
    let buyLabel1 = UILabel()
    let buyLabel2 = UILabel()
    let buyLabel3 = UILabel()
    let buyLabel4 = UILabel()
    
    let revenueLabel = UILabel()
    
    var savedBuyLabelText1: String = ""
    var savedBuyLabelText2: String = ""
    var savedBuyLabelText3: String = ""
    var savedBuyLabelText4: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        setupBuyButton1()
        setupBuyButton2()
        setupBuyButton3()
        setupBuyButton4()
        
        setupBuyLabel1()
        setupBuyLabel2()
        setupBuyLabel3()
        setupBuyLabel4()
        
        setupRevenueLabel()
        setupCompleteDayButton()

    }
    
    // MARK: - настройка кнопок и лейблов
    func setupBuyButton1() {
        buyButton1.setTitle("Купить", for: .normal)
        buyButton1.addTarget(self, action: #selector(button1Tapped), for: .touchUpInside)
        buyButton1.translatesAutoresizingMaskIntoConstraints = false
        
        setupButton1Constraints()
    }
    
    func setupBuyButton2() {
        buyButton2.setTitle("Купить", for: .normal)
        buyButton2.addTarget(self, action: #selector(button2Tapped), for: .touchUpInside)
        buyButton2.translatesAutoresizingMaskIntoConstraints = false
        
        setupButton2Constraints()
    }
    
    func setupBuyButton3() {
        buyButton3.setTitle("Купить", for: .normal)
        buyButton3.addTarget(self, action: #selector(button3Tapped), for: .touchUpInside)
        buyButton3.translatesAutoresizingMaskIntoConstraints = false
        
        setupButton3Constraints()
    }
    
    func setupBuyButton4() {
        buyButton4.setTitle("Купить", for: .normal)
        buyButton4.addTarget(self, action: #selector(button4Tapped), for: .touchUpInside)
        buyButton4.translatesAutoresizingMaskIntoConstraints = false
        
        setupButton4Constraints()
    }
    
    func setupBuyLabel1() {
        buyLabel1.text = "\(BeerManager.shared.beerList[0].price)$ / \(BeerManager.shared.beerList[0].name) (\(BeerManager.shared.beerList[0].country)) / \(BeerManager.shared.beerList[0].volume)L"
        savedBuyLabelText1 = "\(BeerManager.shared.beerList[0].price)$ / \(BeerManager.shared.beerList[0].name) (\(BeerManager.shared.beerList[0].country)) / \(BeerManager.shared.beerList[0].volume)L"
        buyLabel1.textColor = UIColor.black
        buyLabel1.font = UIFont(name: "Helvetica", size: 15)
        buyLabel1.translatesAutoresizingMaskIntoConstraints = false
        buyLabel1.numberOfLines = 2
        
        setupLabel1Constraints()
    }
    
    func setupBuyLabel2() {
        buyLabel2.text = "\(BeerManager.shared.beerList[1].price)$ / \(BeerManager.shared.beerList[1].name) (\(BeerManager.shared.beerList[1].country)) / \(BeerManager.shared.beerList[1].volume)L"
        savedBuyLabelText2 = "\(BeerManager.shared.beerList[1].price)$ / \(BeerManager.shared.beerList[1].name) (\(BeerManager.shared.beerList[1].country)) / \(BeerManager.shared.beerList[1].volume)L"
        buyLabel2.textColor = UIColor.black
        buyLabel2.font = UIFont(name: "Helvetica", size: 15)
        buyLabel2.translatesAutoresizingMaskIntoConstraints = false
        buyLabel2.numberOfLines = 2
        
        setupLabel2Constraints()
        
    }
    
    func setupBuyLabel3() {
        buyLabel3.text = "\(BeerManager.shared.beerList[2].price)$ / \(BeerManager.shared.beerList[2].name) (\(BeerManager.shared.beerList[2].country)) / \(BeerManager.shared.beerList[2].volume)L"
        savedBuyLabelText3 = "\(BeerManager.shared.beerList[2].price)$ / \(BeerManager.shared.beerList[2].name) (\(BeerManager.shared.beerList[2].country)) / \(BeerManager.shared.beerList[2].volume)L"
        buyLabel3.textColor = UIColor.black
        buyLabel3.font = UIFont(name: "Helvetica", size: 15)
        buyLabel3.translatesAutoresizingMaskIntoConstraints = false
        buyLabel3.numberOfLines = 2
        
        setupLabel3Constraints()
    }
    
    func setupBuyLabel4() {
        buyLabel4.text = "\(BeerManager.shared.beerList[3].price)$ / \(BeerManager.shared.beerList[3].name) (\(BeerManager.shared.beerList[3].country)) / \(BeerManager.shared.beerList[3].volume)L"
        savedBuyLabelText4 = "\(BeerManager.shared.beerList[3].price)$ / \(BeerManager.shared.beerList[3].name) (\(BeerManager.shared.beerList[3].country)) / \(BeerManager.shared.beerList[3].volume)L"
        buyLabel4.textColor = UIColor.black
        buyLabel4.font = UIFont(name: "Helvetica", size: 15)
        buyLabel4.translatesAutoresizingMaskIntoConstraints = false
        buyLabel4.numberOfLines = 2
        
        setupLabel4Constraints()
    }
    
    func setupRevenueLabel() {
        revenueLabel.text = "Выручка: \(BeerManager.shared.checkTodayRevenue())"
        revenueLabel.textColor = UIColor.black
        revenueLabel.translatesAutoresizingMaskIntoConstraints = false
        revenueLabel.isHidden = true
        
        setupRevenueLabelConstraints()
    }
    
    func setupCompleteDayButton() {
        completeDayButton.setTitle("Завершить день", for: .normal)
        completeDayButton.addTarget(self, action: #selector(completeDayButtonTapped), for: .touchUpInside)
        completeDayButton.translatesAutoresizingMaskIntoConstraints = false
        
        setupCompleteDayButtonConstraints()
    }
    
    // MARK: - добавление элементов на экран
    func addSubviews() {
        self.view.addSubview(buyButton1)
        self.view.addSubview(buyButton2)
        self.view.addSubview(buyButton3)
        self.view.addSubview(buyButton4)
        
        self.view.addSubview(buyLabel1)
        self.view.addSubview(buyLabel2)
        self.view.addSubview(buyLabel3)
        self.view.addSubview(buyLabel4)
        
        self.view.addSubview(revenueLabel)
        self.view.addSubview(completeDayButton)
    }
    
    // MARK: - создание действий для кнопок
    @objc func button1Tapped() {
        buyLabel1.text = "\(BeerManager.shared.beerList[0].price)$ / \(BeerManager.shared.beerList[0].name) (\(BeerManager.shared.beerList[0].country)) / \(BeerManager.shared.sellBeer1())L"
        revenueLabel.isHidden = false
        revenueLabel.text = "Выручка: \(BeerManager.shared.checkTodayRevenue())"
    }
    
    @objc func button2Tapped() {
        buyLabel2.text = "\(BeerManager.shared.beerList[1].price)$ / \(BeerManager.shared.beerList[1].name) (\(BeerManager.shared.beerList[1].country)) / \(BeerManager.shared.sellBeer2())L"
        revenueLabel.isHidden = false
        revenueLabel.text = "Выручка: \(BeerManager.shared.checkTodayRevenue())"
    }
    
    @objc func button3Tapped() {
        buyLabel3.text = "\(BeerManager.shared.beerList[2].price)$ / \(BeerManager.shared.beerList[2].name) (\(BeerManager.shared.beerList[2].country)) / \(BeerManager.shared.sellBeer3())L"
        revenueLabel.isHidden = false
        revenueLabel.text = "Выручка: \(BeerManager.shared.checkTodayRevenue())"
    }
    
    @objc func button4Tapped() {
        buyLabel4.text = "\(BeerManager.shared.beerList[3].price)$ / \(BeerManager.shared.beerList[3].name) (\(BeerManager.shared.beerList[3].country)) / \(BeerManager.shared.sellBeer4())L"
        revenueLabel.isHidden = false
        revenueLabel.text = "Выручка: \(BeerManager.shared.checkTodayRevenue())"
    }
    
    @objc func completeDayButtonTapped() {
        revenueLabel.text = "Выручка: \(BeerManager.shared.resetRevenue())"
        buyLabel1.text = savedBuyLabelText1
        buyLabel2.text = savedBuyLabelText2
        buyLabel3.text = savedBuyLabelText3
        buyLabel4.text = savedBuyLabelText4
    }
    
    // MARK: - создание констрейнтов для элементов
    func setupButton1Constraints() {
        buyButton1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupButton2Constraints() {
        buyButton2.snp.makeConstraints { make in
            make.top.equalTo(buyButton1.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupButton3Constraints() {
        buyButton3.snp.makeConstraints { make in
            make.top.equalTo(buyButton2.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupButton4Constraints() {
        buyButton4.snp.makeConstraints { make in
            make.top.equalTo(buyButton3.snp.bottom).offset(20)
            make.left.equalToSuperview().offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupLabel1Constraints() {
        buyLabel1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(220)
            make.left.equalTo(buyButton1.snp.rightMargin).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupLabel2Constraints() {
        buyLabel2.snp.makeConstraints { make in
            make.top.equalTo(buyLabel1.snp.bottom).offset(20)
            make.left.equalTo(buyButton2.snp.rightMargin).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupLabel3Constraints() {
        buyLabel3.snp.makeConstraints { make in
            make.top.equalTo(buyLabel2.snp.bottom).offset(20)
            make.left.equalTo(buyButton3.snp.rightMargin).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupLabel4Constraints() {
        buyLabel4.snp.makeConstraints { make in
            make.top.equalTo(buyLabel3.snp.bottom).offset(20)
            make.left.equalTo(buyButton4.snp.rightMargin).offset(30)
            make.width.equalTo(150)
            make.height.equalTo(42)
        }
    }
    
    func setupRevenueLabelConstraints() {
        revenueLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(100)
            make.left.equalToSuperview().offset(50)
            make.width.equalTo(200)
            make.height.equalTo(42)
        }
    }
    
    func setupCompleteDayButtonConstraints() {
        completeDayButton.snp.makeConstraints { make in
            make.top.equalTo(buyButton4.snp.bottom).offset(50)
            make.centerX.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(42)
        }
    }
}
