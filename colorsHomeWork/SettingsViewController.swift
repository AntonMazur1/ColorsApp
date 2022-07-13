//
//  ViewController.swift
//  colorsHomeWork
//
//  Created by Клоун on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet var toolBar: UIToolbar!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redValueTF: UITextField!
    @IBOutlet weak var greenValueTF: UITextField!
    @IBOutlet weak var blueValueTF: UITextField!
    
    var delegate: SettingsViewControllerDelegate!
    var viewBackground: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redValueTF.delegate = self
        greenValueTF.delegate = self
        blueValueTF.delegate = self
        
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 10
        setReceivedColor()
    }
    
    @IBAction func rgbSliderChanged(_ sender: UISlider) {
        setColor()
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(colorView.backgroundColor!)
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func doneToolBarPressed(_ sender: Any) {
        view.endEditing(true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
        setupLabels(for: redValueLabel, blueValueLabel, greenValueLabel)
        setupTextFields(for: redValueTF, greenValueTF,blueValueTF)
    }
    
    private func setReceivedColor() {
        let rgbValues = viewBackground.rgba
        redSlider.value = Float(rgbValues.red)
        blueSlider.value = Float(rgbValues.blue)
        greenSlider.value = Float(rgbValues.green)
        setColor()
    }
    
    private func setupLabels(for labels: UILabel...) {
        for label in labels {
            switch label {
            case redValueLabel:
                redValueLabel.text = String(format: "%.2f", redSlider.value)
            case blueValueLabel:
                blueValueLabel.text = String(format: "%.2f", blueSlider.value)
            default:
                greenValueLabel.text = String(format: "%.2f", greenSlider.value)
            }
        }
    }
    
    private func setupTextFields(for textFields: UITextField...) {
        for textField in textFields {
            switch textField {
            case redValueTF:
                redValueTF.text = redValueLabel.text
            case greenValueTF:
                greenValueTF.text = greenValueLabel.text
            default:
                blueValueTF.text = blueValueLabel.text
            }
        }
    }
}

//MARK: Settings View Controller Delegate
extension SettingsViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        textField.inputAccessoryView = toolBar
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let newValue = textField.text else { return }
        guard let numberValue = Float(newValue) else { return }
        if textField == redValueTF {
            redSlider.value = numberValue
            setColor()
        } else if textField == greenValueTF {
            greenSlider.value = numberValue
            setColor()
        } else {
            blueSlider.value = numberValue
            setColor()
        }
    }
}
