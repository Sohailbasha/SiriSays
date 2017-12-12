//
//  VoiceController.swift
//  SiriSays
//
//  Created by Ilias Basha on 12/11/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import Foundation

class VoiceController {
    static let shared = VoiceController()
    
    var voices: [Voice] = []
    
    init() {
        let us = Voice(language: "en-US", emoji: #imageLiteral(resourceName: "US"))
        let gb = Voice(language: "en-GB", emoji: #imageLiteral(resourceName: "GB"))
        let au = Voice(language: "en-AU", emoji: #imageLiteral(resourceName: "AU"))
        let sa = Voice(language: "en-ZA", emoji: #imageLiteral(resourceName: "SA"))
        let ie = Voice(language: "en-IE", emoji: #imageLiteral(resourceName: "IE"))
        
        voices = [us, gb, au, sa, ie]
    }
}


