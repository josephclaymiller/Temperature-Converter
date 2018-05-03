//
//  CelsiusViewModel.swift
//  Temperature Converter
//
//  Created by Joseph Miller on 4/28/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import UIKit

class CelsiusViewModel: NSObject, UIPickerViewDataSource {
    var tempsCelsius = [Int]()
    
    override init() {
        super.init()
        
        // every 5 degrees from -50 to 0, then every degree from 0 to 50, then every 5 degrees from 50 to 150
        for i in -50...0 {
            if i % 5 == 0 {
                tempsCelsius.append(i)
            }
        }
        for i in 1...50 {
            tempsCelsius.append(i)
        }
        for i in 55...150 {
            if i % 5 == 0 {
                tempsCelsius.append(i)
            }
        }
        
    }
    
    func getImage(celsius: Int) -> UIImage? {
        let waterStateImageName = TemperatureModel.waterState(celsius: celsius)
        return UIImage(named: waterStateImageName)
    }
    
    // UI Picker Data Source methods
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tempsCelsius.count
        
    }
}
