//
//  myRaceCarSlider.swift
//  MultiplicationTableRaceCar
//
//  Created by Chang Sophia on 12/27/18.
//  Copyright © 2018 Chang Sophia. All rights reserved.
//

import Foundation
class myUISlider: UISlider{
    @IBInspectable var thumbImage: UIImage? {
        
        didSet {
            setThumbImage(thumbImage, for: .normal)
        }
    }
    @IBInspectable var thumbImageHightLighted: UIImage? {
        didSet {
            setThumbImage(thumbImageHightLighted, for: .highlighted)
        }
    }
    
}
