//
//  ViewController.swift
//  UISliderDemo
//
//  Created by Chhaileng Peng on 12/2/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBAction func setOnButtonClick(_ sender: Any) {
        if mySwitch.isOn {
            mySwitch.setOn(false, animated: false)
        } else {
            mySwitch.setOn(true, animated: true)
        }
    }
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if mySwitch.isOn {
            label.textColor = .white
            label.text = "Dark Mode is Enable"
            view.backgroundColor = .black
        } else {
            label.textColor = .black
            label.text = "Dark Mode is Disable"
            view.backgroundColor = .white
        }
    }
    
    
    @IBAction func sliderValueChanged(_ sender: UISlider) {
//        label.text = "\(sender.value)"
        label.font = UIFont(name: label.font.fontName, size: CGFloat(sender.value))
        print(sender.value)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 17
//        slider.isContinuous = false
//        slider.minimumValueImage = UIImage(named: "font-small")
//        slider.maximumValueImage = UIImage(named: "font-large")
        slider.setThumbImage(UIImage(named: "line"), for: .normal)
        slider.tintColor = .red
        
        let tapGuester = UITapGestureRecognizer(target: self, action: #selector(sliderTapped(gestureRecognizer:)))
        slider.addGestureRecognizer(tapGuester)
        
        
        
        mySwitch.setOn(false, animated: true)
        
    }
    
    
    @objc func sliderTapped(gestureRecognizer: UIGestureRecognizer) {
        let pointTapped: CGPoint = gestureRecognizer.location(in: self.view)
        
        let positionOfSlider: CGPoint = slider.frame.origin
        let widthOfSlider: CGFloat = slider.frame.size.width
        let newValue = ((pointTapped.x - positionOfSlider.x) * CGFloat(slider.maximumValue) / widthOfSlider)
        
        slider.setValue(Float(newValue), animated: true)
        label.font = UIFont(name: label.font.fontName, size: CGFloat(slider.value))
    }


}

