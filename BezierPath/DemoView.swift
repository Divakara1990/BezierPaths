//
//  DemoView.swift
//  BezierPath
//
//  Created by suresh on 05/06/17.
//  Copyright © 2017 NextEducation. All rights reserved.
//

import UIKit

class DemoView: UIView {

    var path: UIBezierPath!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        self.backgroundColor = UIColor.darkGray
        
       // simpleShapeLayer()
        //maskVsSublayer()
        //twoShapes()
        //complexShape()
        createTextLayer()
    }
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
    }

   /* override func draw(_ rect: CGRect) {
       // self.createRectangle()
        //self.createTriangle()
        //self.path = UIBezierPath(ovalIn: self.bounds)
        //self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.size.height))
        //path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
        //path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 15.0, height: 0.0))
        //path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(180).degreesToRadians, endAngle: CGFloat(0).degreesToRadians, clockwise: true)
        //path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(270).degreesToRadians, endAngle: CGFloat(90).degreesToRadians, clockwise: false)
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(240).degreesToRadians, endAngle: CGFloat(15).degreesToRadians, clockwise: false)
        
        //specify the fill color and apply it to the path
        UIColor.orange.setFill()
        path.fill()
        
        //specify a border (stroke) color.
        UIColor.purple.setStroke()
        path.stroke()
    }*/
    
    override func draw(_ rect: CGRect) {
        
    }
    
    func simpleShapeLayer(){
        self.createRectangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.strokeColor = UIColor.brown.cgColor
        shapeLayer.lineWidth = 3.0
        shapeLayer.path = self.path.cgPath
        self.layer.addSublayer(shapeLayer)
    }
    
    func maskVsSublayer(){
        self.createTriangle()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = UIColor.yellow.cgColor
        
       // self.layer.addSublayer(shapeLayer)
        self.backgroundColor = UIColor.green
        self.layer.mask = shapeLayer
    }
    
    func twoShapes() {
        let width: CGFloat = self.frame.size.width/2
        let height: CGFloat = self.frame.size.height/2
        
        let path1 = UIBezierPath()
        path1.move(to: CGPoint(x: width/2, y: 0.0))
        path1.addLine(to: CGPoint(x: 0.0, y: height))
        path1.addLine(to: CGPoint(x: width, y: height))
        path1.close()
        
        let path2 = UIBezierPath()
        path2.move(to: CGPoint(x: width/2, y: height))
        path2.addLine(to: CGPoint(x: 0.0, y: 0.0))
        path2.addLine(to: CGPoint(x: width, y: 0.0))
        path2.close()
        
        let shapeLayer1 = CAShapeLayer()
        shapeLayer1.path = path1.cgPath
        shapeLayer1.fillColor = UIColor.yellow.cgColor
        
        let shapeLayer2 = CAShapeLayer()
        shapeLayer2.path = path2.cgPath
        shapeLayer2.fillColor = UIColor.green.cgColor
        
       // shapeLayer2.position = CGPoint(x: 0.0, y: height)
        shapeLayer2.position = CGPoint(x: width/2, y: height)
        shapeLayer1.position = CGPoint(x: width/2, y: 0.0)
        
        shapeLayer1.bounds.origin = CGPoint(x: 0.0, y: 0.0)
        shapeLayer1.bounds.size = CGSize(width: 200.0, height: 150.0)
        shapeLayer1.backgroundColor = UIColor.magenta.cgColor
        shapeLayer1.bounds.origin = CGPoint(x: -20.0, y: -40.0)
        self.layer.addSublayer(shapeLayer1)
        self.layer.addSublayer(shapeLayer2)    
    }
    
    func complexShape() {
        path = UIBezierPath()
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width/2 - 50.0, y: 0.0))
        path.addArc(withCenter: CGPoint(x: self.frame.size.width/2 - 25.0, y: 25.0),
                    radius: 25.0,
                    startAngle: CGFloat(180.0).toRadians(),
                    endAngle: CGFloat(0.0).toRadians(),
                    clockwise: false)
        path.addLine(to: CGPoint(x: self.frame.size.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: self.frame.size.width - 50.0, y: 0.0))
        path.addCurve(to: CGPoint(x: self.frame.size.width, y: 50.0),
                      controlPoint1: CGPoint(x: self.frame.size.width + 50.0, y: 25.0),
                      controlPoint2: CGPoint(x: self.frame.size.width - 150.0, y: 50.0))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.close()
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = path.cgPath
        
        self.backgroundColor = UIColor.orange
        self.layer.mask = shapeLayer
    }
    
    func createTextLayer() {
        let textLayer = CATextLayer()
        textLayer.string = "WOW!\nThis is text on a layer!"
        textLayer.foregroundColor = UIColor.white.cgColor
        textLayer.font = UIFont(name: "Avenir", size: 15.0)
        textLayer.fontSize = 15.0
        textLayer.alignmentMode = kCAAlignmentCenter
        textLayer.backgroundColor = UIColor.orange.cgColor
        textLayer.frame = CGRect(x: 0.0, y: self.frame.size.height/2 - 20.0, width: self.frame.size.width, height: 40.0)
        textLayer.contentsScale = UIScreen.main.scale
        self.layer.addSublayer(textLayer)
    }
    
    func createRectangle() {
        //Initialize the path
        path = UIBezierPath()
        
        //Specify the point that the path should start get drawn.
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        
        //create a line between the starting point and the bottom-left side of the view
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        
        // Create the bottom line (bottom-left to bottom-right).
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        
        // Create the vertical line from the bottom-right to the top-right side.
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        
        // Close the path. This will create the last line automatically.
        path.close()
    }
    
    func createTriangle(){
        path = UIBezierPath()
        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
}
extension Int {
    var degreesToRadians: Double { return Double(self) * .pi / 180 }
}
extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
extension CGFloat{
    func toRadians() -> CGFloat{
        return self * CGFloat(M_PI) / 180.0
    }
}