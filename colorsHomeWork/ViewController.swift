//
//  ViewController.swift
//  colorsHomeWork
//
//  Created by Клоун on 24.06.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var blueValueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    private let cornerRadiusValue: CGFloat = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewColor()
        colorView.layer.cornerRadius = cornerRadiusValue
    }
    
    @IBAction func redValueChanged() {
        redValueLabel.text = String(format: "%.2f", redSlider.value)
        setupViewColor()
    }
    
    @IBAction func greenValueChanged() {
        greenValueLabel.text = String(format: "%.2f", greenSlider.value)
        setupViewColor()
    }
    
    @IBAction func blueValueChanged() {
        blueValueLabel.text = String(format: "%.2f", blueSlider.value)
        setupViewColor()
    }
    
    private func setupViewColor() {
        colorView.backgroundColor = UIColor(
            red: CGFloat(redSlider.value),
            green: CGFloat(greenSlider.value),
            blue: CGFloat(blueSlider.value),
            alpha: 1
        )
    }
}

