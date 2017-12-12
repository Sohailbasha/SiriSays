//
//  ViewController.swift
//  SiriSays
//
//  Created by Ilias Basha on 12/8/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var textField: UITextView!
    let speechSynthesizer = AVSpeechSynthesizer()
    
    var defaultPitchSpeed: Float = 1.0
    var defaultUtteranceRate: Float = 0.5
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let text = textField.text {
            let utterance = AVSpeechUtterance.init(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            utterance.pitchMultiplier = defaultPitchSpeed
            utterance.rate = defaultUtteranceRate
            speechSynthesizer.speak(utterance)
        }
    }
    
    @IBAction func slide(_ sender: UISlider) {
        switch sender.tag {
        case 0:
            defaultPitchSpeed = sender.value
        case 1:
            defaultUtteranceRate = sender.value
        default:
            break
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}

