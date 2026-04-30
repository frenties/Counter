import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var counterLabel: UILabel!
    
    @IBOutlet private weak var plusButton: UIButton!
    
    @IBOutlet private weak var minusButton: UIButton!
    
    @IBOutlet private weak var resetButton: UIButton!
    
    @IBOutlet private weak var changeHistoryTextView: UITextView!
    
    private var counterValue:Int = 0
    private let changeHistoryHeader = "История изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterValue)
        changeHistoryTextView.text = changeHistoryHeader
        changeHistoryTextView.isEditable = false
        
    }
    
    private func updateCounter() {
        counterLabel.text = "Значение счётчика: \(counterValue)"
    }
    private func getCurrentDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d-M-yyyy H:mm:ss"
        
        return dateFormatter.string(from: Date())
        
    }
    
    
    @IBAction private func plusButtonTapped(_ sender: Any) {
        counterValue += 1
        updateCounter()
        changeHistoryTextView.text += "[\(getCurrentDateTime())]: Значение изменено на +1 \n"
    }
    
    @IBAction private func minusButtonTapped(_ sender: Any) {
        if counterValue <= 0 {
            counterLabel.text = "Некорректное значение"
            changeHistoryTextView.text += "[\(getCurrentDateTime())]: Попытка уменьшить значение счётчика ниже 0 \n"
        } else {
            counterValue -= 1
            updateCounter()
            changeHistoryTextView.text += "[\(getCurrentDateTime())]: Значение изменено на -1 \n"
        }
    }
    
    @IBAction private func resetButtonTapped(_ sender: Any) {
        counterValue = 0
        counterLabel.text = String(counterValue)
        changeHistoryTextView.text += "[\(getCurrentDateTime())]: Значение сброшено \n"
        
    }
    
    
}
