//
//  UIView+Extention.swift
//  SpaceXTestApp
//
//  Created by Vladislav Avrutin on 16.06.2024.
//

import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner,
                      radius: CGFloat) {
        
        let bounds = self.bounds
        
        let maskPath = UIBezierPath(roundedRect: bounds,
                                    byRoundingCorners: corners,
                                    cornerRadii: .init(width: radius, height: radius))
        
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        
        self.layer.mask = maskLayer
        
        let frameLayer = CAShapeLayer()
        frameLayer.frame = bounds
        frameLayer.path = maskPath.cgPath
        frameLayer.fillColor = nil
        
        self.layer.addSublayer(frameLayer)
    }
}
