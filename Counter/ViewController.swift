//
//  ViewController.swift
//  Counter
//
//  Created by Ксения Ягодкина on 28.04.2026.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var pressButton: UIButton!
    
    @IBOutlet weak var counter: UILabel!
    private var counterButton = 0
    
    override func viewDidLoad() {
        counter.text = String(counterButton)
        pressButton.setTitle("Значение счётчика: \(counter.text!)", for: .normal)
    }
    
    @IBAction func counterTouchDown(_ sender: Any) {
        counterButton += 1
        
        viewDidLoad()
    }
    
}

