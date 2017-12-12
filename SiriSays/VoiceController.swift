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
        let us = Voice(language: "en-US", emojiUnicode: <#Unicode#>, emojiUnicode: "u\1F1FA")
        
    }
}


