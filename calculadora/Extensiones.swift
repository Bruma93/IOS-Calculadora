//
//  Extensiones.swift
//  calculadora
//
//  Created by estech on 11/1/23.
//

import Foundation
import UIKit

extension UIButton{
//borde redondo
    
    func round(){
        layer.cornerRadius = bounds.height/3
        clipsToBounds = true
    }
}

extension UIStackView{
    func round(){
        layer.cornerRadius = bounds.height/8
        clipsToBounds = true
    }
}
