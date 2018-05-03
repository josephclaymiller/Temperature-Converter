//
//  CelsiusToFahrenheitViewController.swift
//  Temperature Converter
//
//  Created by Joseph Miller on 5/2/18.
//  Copyright © 2018 Joseph Miller. All rights reserved.
//

import UIKit

class CelsiusToFahrenheitViewController: UIViewController, UIPickerViewDelegate {
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var tempImage: UIImageView!
    @IBOutlet weak var celsiusPicker: UIPickerView!
    @IBOutlet var celsiusViewModel: CelsiusViewModel!
    var celsius: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        celsius = celsiusViewModel.tempsCelsius[0]
        updateUI()
    }

    func updateUI() {
        // set label and image
        let fahrenheit = TemperatureModel.toFahrenheit(celsius: celsius)
        let waterState = TemperatureModel.waterState(celsius: celsius)
        fahrenheitLabel.text = String(fahrenheit) + " °F"
        tempImage.image = UIImage(named:waterState)
    }
    
    // Mark: - UI Picker View delegate functions
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let tempForRow = celsiusViewModel.tempsCelsius[row]
        return String(tempForRow) + " °C"
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        celsius = celsiusViewModel.tempsCelsius[row]
        updateUI()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if let destinationController = segue.destination as? FahrenheitToCelsiusViewController {
            // TODO: match selected temperature when switching units
        }
    }
     */

}
