//
//  TemperatureModel.swift
//  Temperature Converter
//
//  Created by Joseph Miller on 4/28/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import UIKit

class TemperatureModel {
    class func toFahrenheit(celsius: Int) -> Int {
        return Int(Double(celsius) * 1.8 + 32)
    }
    
    class func toCelsius(fahrenheit: Int) -> Int {
        return Int(Double(fahrenheit - 32) / 1.8)
    }

    class func waterState(celsius: Int) -> String {
        if celsius < 0 {
            return "ice"
        } else if celsius <= 100 {
            return "water"
        } else {
            return "steam"
        }
    }
    
    //  ice if temperature < 32 F
    //  water if temperature is between 32 and 212 F (inclusive)
    //  steam if temperature is over 212 F
    class func waterState(fahrenheit: Int) -> String {
        if fahrenheit < 32 {
            return "ice"
        } else if fahrenheit <= 212 {
            return "water"
        } else {
            return "steam"
        }
    }
}
