//
//  MainViewController.swift
//  colorsHomeWork
//
//  Created by Клоун on 12.07.2022.
//

import UIKit

protocol SettingsViewControllerDelegate {
    func setNewColor(_ newColor: UIColor)
}

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var mainColorView: UIView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let settingVC = segue.destination as? SettingsViewController else { return }
        //let colorComponents = (mainColorView.backgroundColor?.cgColor)?.components
        settingVC.viewBackground = mainColorView.backgroundColor
        settingVC.delegate = self
    }
}

extension MainViewController: SettingsViewControllerDelegate {
    func setNewColor(_ newColor: UIColor) {
        mainColorView.backgroundColor = newColor
    }
}
