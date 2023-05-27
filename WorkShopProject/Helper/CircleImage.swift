//
//  CircleImage.swift
//  WorkShopProject
//
//  Created by Aya Mohamed Ahmed on 27/05/2023.
//

import Foundation
import UIKit

func circleImage(image : UIImageView){
        
        image.layer.cornerRadius = image.frame.height / 2
        
        image.clipsToBounds = true
    }
