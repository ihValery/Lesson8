//
//  ViewController.swift
//  HomeWorkLesson8
//
//  Created by Валерий Игнатьев on 29.01.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var setAlarmButton: UIButton!
    @IBOutlet weak var deletAlarmButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var switchOnOffAlarm: UISwitch!
    @IBOutlet weak var setTimeLabel: UILabel!
    @IBOutlet weak var volumeProgressView: UIProgressView!
    @IBOutlet weak var volumeSlider: UISlider!
    @IBOutlet weak var volumeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setAlarmButton.setTitleColor(.black, for: .normal)
        setAlarmButton.backgroundColor = .systemPurple
        setAlarmButton.layer.cornerRadius = 13
        
        deletAlarmButton.setTitleColor(.black, for: .normal)
        deletAlarmButton.backgroundColor = .systemPurple
        deletAlarmButton.layer.cornerRadius = 13
        
        isHiddenSettingAlarm(myBool: true)
        // Do any additional setup after loading the view.
    }
    @IBAction func setAlarmButtonAction(_ sender: UIButton) {
        isHiddenSettingAlarm(myBool: false)
    }
    
    func isHiddenSettingAlarm(myBool: Bool) {
        setTimeLabel.isHidden = myBool
        switchOnOffAlarm.isHidden = myBool
        volumeProgressView.isHidden = myBool
        volumeSlider.isHidden = myBool
        volumeTextField.isHidden = myBool
    }
}

