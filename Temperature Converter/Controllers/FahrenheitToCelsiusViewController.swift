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
    var fahrenheit: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fahrenheit = fahrenheitViewModel.tempsFahrenheit[0]
        updateUI()
    }
    
    @IBAction func switchUnitsButtonPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        let celsius = TemperatureModel.toCelsius(fahrenheit: fahrenheit)
        let waterState = TemperatureModel.waterState(fahrenheit: fahrenheit)
        celsiusLabel.text = String(celsius) + " °C"
        tempImage.image = UIImage(named:waterState)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
