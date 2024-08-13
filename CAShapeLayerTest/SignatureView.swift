//
//  SignatureView.swift
//  CAShapeLayerTest
//
//  Created by 紹郁 on 2024/8/13.
//

import UIKit

class SignatureView: UIView {
    
    private var lines: [[CGPoint]] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.backgroundColor = .white
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lines.append([CGPoint]())
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let point = touches.first?.location(in: self), var lastLine = lines.popLast() else {
            return
        }
        lastLine.append(point)
        lines.append(lastLine)
        setNeedsDisplay()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(2)
        context.setLineCap(.round)
        
        lines.forEach { line in
            guard let firstPoint = line.first else { return }
            context.beginPath()
            context.move(to: firstPoint)
            line.dropFirst().forEach { point in
                context.addLine(to: point)
            }
            context.strokePath()
        }
    }
    
    func clear() {
        lines.removeAll()
        setNeedsDisplay()
    }
}

