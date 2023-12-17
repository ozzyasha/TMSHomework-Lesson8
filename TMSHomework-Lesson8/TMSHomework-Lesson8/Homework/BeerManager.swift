//
//  BeerManager.swift
//  Lesson8
//
//  Created by berdy on 12.12.23.
//

import Foundation
import UIKit

class BeerManager {
    static let shared = BeerManager()
    private var revenue: Double = 0 // Выручка
    
    private init() {}
    
    let beerList = [Beer(name: "Heineken", price: 2.00, country: "Netherlands", volume: 10), Beer(name: "Guinness", price: 2.55, country: "Ireland", volume: 8), Beer(name: "Pilsner", price: 1.80, country: "Czech Republic", volume: 12), Beer(name: "Corona Extra", price: 2.40, country: "Mexico", volume: 7), Beer(name: "Alivaria White Gold", price: 1.50, country: "Belarus", volume: 9), Beer(name: "Stella Artois", price: 2.00, country: "Belgium", volume: 10)]
        
    
    func createBuyLabelsArray() -> [String] {
        var buyLabels = [String]()
        beerList.forEach { beer in
            let beerLabel = "\(beer.price)$ / \(beer.name) (\(beer.country)) / \(beer.volume)L"
            buyLabels.append(beerLabel)
        }
        return buyLabels
    }
    
    //Метод продажи пива
    func sellBeer(label: UILabel){
        self.revenue += 2
        label.text = "Выручка: \(revenue)"
    }
    //Метод проверки выручки за сегодня
    func checkTodayRevenue(label: UILabel){
        label.text = "Выручка: \(revenue)"
    }
    
    //Метод обнуления выручки после наступления следующего дня
    func resetRevenue() {
        self.revenue = 0
    }
    
    //Метод который проверяет и показывает остаток пива
    func checkAndDisplayBeerLeftover() {
        
    }
}
