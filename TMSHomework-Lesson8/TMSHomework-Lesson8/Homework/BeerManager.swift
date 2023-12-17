//
//  BeerManager.swift
//  Lesson8
//
//  Created by berdy on 12.12.23.
//

import Foundation

class BeerManager {
    static let shared = BeerManager()
    private var revenue: Double = 0 // Выручка
    
    private init() {}
    
    let beerList = [Beer(name: "Heineken", price: 2.00, country: "Netherlands", volume: 10), Beer(name: "Guinness", price: 2.55, country: "Ireland", volume: 8), Beer(name: "Pilsner", price: 1.80, country: "Czech Republic", volume: 12), Beer(name: "Corona Extra", price: 2.40, country: "Mexico", volume: 7)]
        
    //Метод продажи пива
    func sellBeer1() -> Int {
        if beerList[0].volume != 0 {
            beerList[0].volume -= 1
            self.revenue += beerList[0].price
        }
        return beerList[0].volume
    }
    
    func sellBeer2() -> Int{
        if beerList[1].volume != 0 {
            beerList[1].volume -= 1
            self.revenue += beerList[1].price
        }
        return beerList[1].volume
    }
    
    func sellBeer3() -> Int{
        if beerList[2].volume != 0 {
            beerList[2].volume -= 1
            self.revenue += beerList[2].price
        }
        return beerList[2].volume
    }
    
    func sellBeer4() -> Int{
        if beerList[3].volume != 0 {
            beerList[3].volume -= 1
            self.revenue += beerList[3].price
        }
        return beerList[3].volume
    }
    
    //Метод проверки выручки за сегодня
    func checkTodayRevenue() -> String {
        return String(format: "%.2f", revenue)
    }
    
    //Метод обнуления выручки после наступления следующего дня
    func resetRevenue() -> String {
        self.revenue = 0
        return String(format: "%.2f", revenue)
    }
    
}
