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
        
        deletAlarmButton.setTitleColor(.systemPurple, for: .normal)
        deletAlarmButton.backgroundColor = .systemPurple
        deletAlarmButton.layer.cornerRadius = 13
        deletAlarmButton.isEnabled = false
        
        volumeProgressView.trackTintColor = .systemPurple
        volumeProgressView.progressTintColor = .lightGray
        volumeSlider.tintColor = .systemPurple
        volumeSlider.thumbTintColor = .systemPurple
        switchOnOffAlarm.onTintColor = .systemPurple
        volumeTextField.placeholder = "7"
        
        volumeSlider.minimumValue = 0
        volumeSlider.maximumValue = 10
        volumeSlider.setValue(7, animated: true)
        
        volumeProgressView.setProgress(0.7, animated: true)
        
        isHiddenSettingAlarm(bool: true)
        switchOneAlarm(bool: true)
        // Do any additional setup after loading the view.
    }
    var timeStringForLabel = "11:11 AM"
    var volumeLevel = 7
    
    
    //Нажимаем кнопку Установть
    @IBAction func setAlarmButtonAction(_ sender: UIButton) {
        isHiddenSettingAlarm(bool: false)
        deletAlarmButton.isEnabled = true
        deletAlarmButton.setTitleColor(.black, for: .normal)
        
        if switchOnOffAlarm.isOn {
            setTimeLabel.text = timeStringForLabel
            switchOneAlarm(bool: false)
        }
    }
    
    @IBAction func deletAlarmButtonAction(_ sender: Any) {
        setTimeLabel.text = ""
        isHiddenSettingAlarm(bool: true)
        switchOneAlarm(bool: true)
        deletAlarmButton.isEnabled = false
        deletAlarmButton.setTitleColor(.systemPurple, for: .normal)
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        if switchOnOffAlarm.isOn {
            switchOneAlarm(bool: false)
            setTimeLabel.alpha = 1
        } else {
            switchOneAlarm(bool: true)
            setTimeLabel.alpha = 0.3
        }
    }
    
    @IBAction func sliderChanger(_ sender: UISlider) {
        volumeLevel = Int(volumeSlider.value)
//      volumeLevel = sender.value
        volumeTextField.text = String(volumeLevel)
        volumeProgressView.setProgress((Float(volumeLevel) / 10), animated: true)
        //myTestLabel.text = volumeLevel
        
    }
   
    @IBAction func textFieldAction(_ sender: UITextField) {
        volumeTextField.enablesReturnKeyAutomatically = true
        volumeTextField.keyboardType = .numbersAndPunctuation
        guard volumeTextField.text?.isEmpty == false else {         //что бы при пустом поле алерты не задолбали )))
            return
        }                                                           //Проверка что бы вводились только цифры
        if let myItem = Int(volumeTextField.text!) {                //Смогли достать опционал Int значения?
            if myItem >= 0 && myItem <= 10 {
                volumeSlider.setValue(Float(myItem), animated: true)
                volumeLevel = myItem
            } else {                                                //Алерты запоминаем. Работаем!
                let alert = UIAlertController(title: "Оу оу оу Warning!", message: "Попробуй от 0 до 10.", preferredStyle: .actionSheet)                                          //Замыкания пока еще сложны, но уже так нравятся
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                                                self.volumeTextField.text = String(self.volumeLevel) }))
                present(alert, animated: true, completion: nil)
            }
        } else {                                //экземляр класа UIAlertController с одним из возможных init
            let alert = UIAlertController(title: "Оу оу оу Warning!", message: "Так же можно и сломать приложение! Попробуй цифры.", preferredStyle: .alert)
            //вместо замыкания можно было просто nil )))
                                                //экземпляк класа UIAlertAction для действия пользователя (Ok, Cancel)
            let myAlertAction = UIAlertAction(title: "Ok", style: .default, handler: { _ in
                                                self.volumeTextField.text = String(self.volumeLevel) })
            alert.addAction(myAlertAction)      //Отображение данного alerta на экране
            present(alert, animated: true, completion: nil)
        }
        volumeProgressView.setProgress((Float(volumeLevel) / 10), animated: true)
    }
    
    //Крутим барабан. На прямую присвоить нельзя. Запоминаем работаем
    @IBAction func changeTimeDatePicker(_ sender: UIDatePicker) {
        let timeFormatter = DateFormatter()
 
        timeFormatter.timeStyle = .short
        timeStringForLabel = timeFormatter.string(from: sender.date)
//        setAlarmButton.setTitleColor(.black, for: .normal)
    }
    //скрываем наши объекты
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

