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
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: 45, height: 45)
        let frame = CGRect(x: 0, y: 50, width: UIScreen.main.bounds.width, height: 50)
        let cv = UICollectionView(frame: frame, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.clear
        return cv
    }()
    
    let speechSynthesizer = AVSpeechSynthesizer()
    var defaultPitchSpeed: Float = 1.0
    var defaultUtteranceRate: Float = 0.5
    var defaultLanguage = "en-US"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(FlagCollectionViewCell.self, forCellWithReuseIdentifier: "flagCell")
        self.view.addSubview(collectionView)
    }
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if let text = textField.text {
            let utterance = AVSpeechUtterance.init(string: text)
            utterance.voice = AVSpeechSynthesisVoice(language: defaultLanguage)
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

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return VoiceController.shared.voices.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "flagCell", for: indexPath) as? FlagCollectionViewCell
        let language = VoiceController.shared.voices[indexPath.row]
        cell?.language = language
        return cell ?? UICollectionViewCell()
    }
    
    
}



















