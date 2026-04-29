//
//  ViewController.swift
//  Counter
//
//  Created by Ксения Ягодкина on 28.04.2026.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterLabel: UILabel!
    
    @IBOutlet weak var buttonPlus: UIButton!
    
    @IBOutlet weak var buttonMinus: UIButton!
    
    @IBOutlet weak var buttonToReset: UIButton!
    
    @IBOutlet weak var changeHistory: UITextView!
    
    private var counterOf:Int = 0
    private let changeHistoryHeader = "Историй изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterOf)
        changeHistory.text = changeHistoryHeader
        changeHistory.isEditable = false
        
    }
    
    private func updateCounter() {
        counterLabel.text = String("Значение счётчика: \(counterOf)")
    }
    
    @IBAction func buttonPlusTouchDown(_ sender: Any) {
        counterOf += 1
        updateCounter()
        changeHistory.text += "[\(getCurrentDateTime())]: Значение изменено на +1 \n"
    }
    
    @IBAction func buttonMinusTouchDown(_ sender: Any) {
        if counterOf <= 0 {
            counterLabel.text = "Некорректное значение"
            changeHistory.text += "[\(getCurrentDateTime())]: Попытка уменьшить значение счётчика ниже 0 \n"
        } else {
            counterOf -= 1
            updateCounter()
            changeHistory.text += "[\(getCurrentDateTime())]: Значение изменено на -1 \n"
        }
    }
    
    @IBAction func resetTouchDown(_ sender: Any) {
        counterOf = 0
        counterLabel.text = String(counterOf)
        changeHistory.text += "[\(getCurrentDateTime())]: Значение сброшено \n"
        
    }
    
    private func getCurrentDateTime() -> String {
        let formatTime = DateFormatter()
        formatTime.dateFormat = "d-M-yyyy H:mm:ss"
        
        return formatTime.string(from: Date())
        
    }
}
