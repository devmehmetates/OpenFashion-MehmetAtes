//
//  DividerView.swift
//  OpenFashion-MehmetAtes
//
//  Created by Mehmet Ateş on 31.07.2022.
//

import UIKit

extension UIView {
    
    func drawDividerShape() {
        let shapeWidth = UIScreen.main.bounds.width
        let startPoint = (shapeWidth / 2) - 50

        // create shape layer
        let shapeLayer = CAShapeLayer()
        shapeLayer.frame = self.bounds
        shapeLayer.lineWidth = 0.5
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor(named: ColorNames.labelColor)?.cgColor

        self.layer.addSublayer(shapeLayer)

        // create path
        let path = UIBezierPath()

        // start line
        path.move(to: CGPoint(x: startPoint, y: 0))
        path.addLine(to: CGPoint(x: startPoint + 45, y: 0))
        
        // rectangle
        path.move(to: CGPoint(x: startPoint + 45, y: 0))
        path.addLine(to: CGPoint(x: startPoint + 50, y: 5))
        path.move(to: CGPoint(x: startPoint + 45, y: 0))
        path.addLine(to: CGPoint(x: startPoint + 50, y: -5))
        path.move(to: CGPoint(x: startPoint + 50, y: 5))
        path.addLine(to: CGPoint(x: startPoint + 55, y: 0))
        path.move(to: CGPoint(x: startPoint + 50, y: -5))
        path.addLine(to: CGPoint(x: startPoint + 55, y: 0))
        
        // finish line
        path.move(to: CGPoint(x: startPoint + 55, y: 0))
        path.addLine(to: CGPoint(x: startPoint + 95, y: 0))
        path.close()
        shapeLayer.path = path.cgPath
    }
}
