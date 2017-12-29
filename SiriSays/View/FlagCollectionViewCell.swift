//
//  FlagCollectionViewCell.swift
//  SiriSays
//
//  Created by Ilias Basha on 12/11/17.
//  Copyright © 2017 Sohail. All rights reserved.
//

import UIKit
import Foundation

class FlagCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageView.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        imageView.contentMode = .scaleAspectFill
        self.addSubview(imageView)
    }
    
    let imageView = UIImageView()
    
    var language: Voice? {
        didSet {
            if let language = language {
                self.imageView.image = language.emoji
            }
        }
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
