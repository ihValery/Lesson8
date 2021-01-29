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
        setAlarmButton.setTitleColor(.systemPurple, for: .normal)
        setAlarmButton.backgroundColor = .systemPurple
        setAlarmButton.layer.cornerRadius = 13
        
        deletAlarmButton.setTitleColor(.systemPurple, for: .normal)
        deletAlarmButton.backgroundColor = .systemPurple
        deletAlarmButton.layer.cornerRadius = 13
        deletAlarmButton.isEnabled = false
        
        volumeProgressView.trackTintColor = .lightGray
        volumeProgressView.progressTintColor = .systemPurple
        volumeSlider.tintColor = .systemPurple
        switchOnOffAlarm.onTintColor = .systemPurple
        volumeTextField.placeholder = "0.0"
        
        isHiddenSettingAlarm(bool: true)
        switchOneAlarm(bool: true)
        // Do any additional setup after loading the view.
    }
    var timeStringForLabel = ""
    
    //Нажимаем кнопку Установть
    @IBAction func setAlarmButtonAction(_ sender: UIButton) {
        isHiddenSettingAlarm(bool: false)
        setTimeLabel.text = timeStringForLabel
        deletAlarmButton.isEnabled = true
        deletAlarmButton.setTitleColor(.black, for: .normal)
        switchOneAlarm(bool: false)

    }
    
    @IBAction func deletAlarmButtonAction(_ sender: Any) {
        setTimeLabel.text = ""
        isHiddenSettingAlarm(bool: true)
        switchOneAlarm(bool: true)
        deletAlarmButton.isEnabled = false
        deletAlarmButton.setTitleColor(.systemPurple, for: .normal)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if volumeProgressView.isHidden {
            switchOneAlarm(bool: false)
            setTimeLabel.alpha = 1
        } else {
            switchOneAlarm(bool: true)
            setTimeLabel.alpha = 0.3
        }
    }
    
    @IBAction func sliderChanger(_ sender: UISlider) {
        
    }
    
    //Крутим барабан. На прямую присвоить нельзя. Запоминаем работаем
    @IBAction func changeTimeDatePicker(_ sender: UIDatePicker) {
        setAlarmButton.setTitleColor(.black, for: .normal)
        
        let timeFormatter = DateFormatter()
        
        timeFormatter.timeStyle = .short
        timeStringForLabel = timeFormatter.string(from: sender.date)
    }
    
    func isHiddenSettingAlarm(bool: Bool) {
        setTimeLabel.isHidden = bool
        switchOnOffAlarm.isHidden = bool
    }
    
    func switchOneAlarm(bool: Bool) {
        volumeProgressView.isHidden = bool
        volumeSlider.isHidden = bool
        volumeTextField.isHidden = bool
    }
}

