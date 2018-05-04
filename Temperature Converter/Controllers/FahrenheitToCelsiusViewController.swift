//
//  FahrenheitToCelsiusViewController.swift
//  Temperature Converter
//
//  Created by Joseph Miller on 5/1/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import UIKit

class FahrenheitToCelsiusViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitPicker: UIPickerView!
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet var fahrenheitViewModel: FahrenheitViewModel!
    var fahrenheit: Int = 32
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func switchUnitsButtonPressed(_ sender: UIButton) {
         // Match selected temperature when switching units
        if let celsiusController = self.presentingViewController as? CelsiusToFahrenheitViewController {
            let celsius = TemperatureModel.toCelsius(fahrenheit: fahrenheit)
            celsiusController.celsius = celsius
            celsiusController.updateUI()
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        let row = fahrenheitViewModel.rowForTemp(fahrenheit: fahrenheit)
        fahrenheit = fahrenheitViewModel.tempsFahrenheit[row]
        let celsius = TemperatureModel.toCelsius(fahrenheit: fahrenheit)
        let waterState = TemperatureModel.waterState(fahrenheit: fahrenheit)
        celsiusLabel.text = String(celsius) + " °C"
        tempImage.image = UIImage(named:waterState)
        fahrenheitPicker.selectRow(row, inComponent: 0, animated: false)
    }
    
    // Mark: - UI Picker View delegate functions
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tempForRow = fahrenheitViewModel.tempsFahrenheit[row]
        return String(tempForRow) + " °F"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        fahrenheit = fahrenheitViewModel.tempsFahrenheit[row]
        updateUI()
    }
    
}
