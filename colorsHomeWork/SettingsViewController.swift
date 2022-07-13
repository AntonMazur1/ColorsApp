//
//  ViewController.swift
//  colorsHomeWork
//
//  Created by Клоун on 24.06.2022.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var delegate: SettingsViewControllerDelegate!
    var viewBackground: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        colorView.layer.cornerRadius = 10
        setReceivedColor()
        setupLabels(for: redValueLabel, blueValueLabel, greenValueLabel)
    }
    
    @IBAction func rgbSliderChanged(_ sender: UISlider) {
        setColor()
        setupLabels(for: redValueLabel, blueValueLabel, greenValueLabel)
    }
    
    @IBAction func doneButtonPressed() {
        delegate.setNewColor(colorView.backgroundColor!)
        navigationController?.popViewController(animated: true)
    }
    
    private func setColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
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
}

