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
    @IBOutlet var pitchSlider: UISlider!
    @IBOutlet var speedSlider: UISlider!
    @IBOutlet var lowLabel: UILabel!
    @IBOutlet var highLabel: UILabel!
    @IBOutlet var slowLabel: UILabel!
    @IBOutlet var fastLabel: UILabel!
    @IBOutlet var playButton: UIButton!
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 1
        layout.minimumLineSpacing = 1
        layout.itemSize = CGSize(width: 45, height: 45)
        let frame = CGRect(x: 0, y: 70, width: UIScreen.main.bounds.width, height: 50)
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
        setupViews()
    }
    
    func setupViews() {
        
        NSLayoutConstraint(item: textField, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 8.0).isActive = true
        
        NSLayoutConstraint(item: textField, attribute: .trailing, relatedBy: .equal, toItem: view, attribute: .trailingMargin, multiplier: 1.0, constant: 8.0).isActive = true
        
        NSLayoutConstraint(item: textField, attribute: .top, relatedBy: .equal, toItem: collectionView, attribute: .bottom, multiplier: 1.0, constant: 8.0).isActive = true
        
        NSLayoutConstraint(item: textField, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: 300).isActive = true
        
        // allign lowlabel slider and highlabel
        NSLayoutConstraint(item: lowLabel, attribute: .top, relatedBy: .equal, toItem: textField, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        
        NSLayoutConstraint(item: pitchSlider, attribute: .top, relatedBy: .equal, toItem: textField, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        
        NSLayoutConstraint(item: highLabel, attribute: .top, relatedBy: .equal, toItem: textField, attribute: .bottom, multiplier: 1.0, constant: 10.0).isActive = true
        
        
        let c2: CGFloat = 50.0
        
        NSLayoutConstraint(item: slowLabel, attribute: .top, relatedBy: .equal, toItem: lowLabel, attribute: .bottom, multiplier: 1.0, constant: c2).isActive = true
        
        NSLayoutConstraint(item: speedSlider, attribute: .top, relatedBy: .equal, toItem: pitchSlider, attribute: .bottom, multiplier: 1.0, constant: c2).isActive = true
        
        NSLayoutConstraint(item: fastLabel, attribute: .top, relatedBy: .equal, toItem: highLabel, attribute: .bottom, multiplier: 1.0, constant: c2).isActive = true
        
        
        NSLayoutConstraint(item: lowLabel, attribute: .leading, relatedBy: .equal, toItem: view, attribute: .leadingMargin, multiplier: 1.0, constant: 8.0).isActive = true
        
        NSLayoutConstraint(item: pitchSlider, attribute: .leading, relatedBy: .equal, toItem: lowLabel, attribute: .trailingMargin, multiplier: 1.0, constant: 8.0).isActive = true
        
        NSLayoutConstraint(item: highLabel, attribute: .leading, relatedBy: .equal, toItem: pitchSlider, attribute: .trailingMargin, multiplier: 1.0, constant: 8.0).isActive = true

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



















