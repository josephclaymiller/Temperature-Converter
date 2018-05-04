//
//  FahrenheitViewModel.swift
//  Temperature Converter
//
//  Created by Joseph Miller on 4/28/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//


import UIKit

class FahrenheitViewModel: NSObject, UIPickerViewDataSource {
    var tempsFahrenheit = [Int]() // fahrenheit temperatures ranging from 0 to 250 F
    
    override init() {
        super.init()
        
        // every 2 degrees from 0 to 32, then every degree from 33 to 212, then every 2 degrees from 213 to 250
        for i in 0...32 {
            if i % 2 == 0 {
                tempsFahrenheit.append(i)
            }
        }
        for i in 33...212 {
            tempsFahrenheit.append(i)
        }
        for i in 213...250 {
            if i % 2 == 0 {
                tempsFahrenheit.append(i)
            }
        }
        
    }
    
    func rowForTemp(fahrenheit: Int) -> Int {
        let minTemp = tempsFahrenheit[0]
        let maxTemp = tempsFahrenheit[tempsFahrenheit.count-1]
        if fahrenheit <= minTemp {
            return 0
        }
        if fahrenheit >= maxTemp {
            return tempsFahrenheit.count-1
        }
        // find fahrenheit in tempsFahrenheit array
        if tempsFahrenheit.contains(fahrenheit) {
            return tempsFahrenheit.index(of: fahrenheit)!
        } else {
            return rowForTemp(fahrenheit: fahrenheit - fahrenheit % 2)
        }
    }
    
    // MARK: - Image methods
    // get image string for selected temp from TemperatureModel
    func getImage(fahrenheit: Int) -> UIImage? {
        let waterStateImageName = TemperatureModel.waterState(celsius: fahrenheit)
        return UIImage(named: waterStateImageName)
    }
    
    // MARK: - UI Picker Data Source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempsFahrenheit.count
    }
}
