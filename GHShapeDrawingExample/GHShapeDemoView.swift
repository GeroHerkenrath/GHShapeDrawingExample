//
//  GHShapeDemoView.swift
//  GHShapeDrawingExample
//
//  Created by Gero Herkenrath on 21/10/2016.
//  Copyright © 2016 Gero Herkenrath. All rights reserved.
//

import Cocoa

class GHShapeDemoView: NSView {
	
	struct Shape {
		var p1:CGPoint = NSMakePoint(0.0, 0.0)
		var p2:CGPoint = NSMakePoint(0.0, 0.0)
		var p3:CGPoint = NSMakePoint(0.0, 0.0)
		var p4:CGPoint?
	}
	
	var shapes:[Shape] = []
	
	override internal var isFlipped: Bool {
		return true
	}
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		
		NSColor.white.setFill()
		let updatedRect = NSBezierPath.init(rect: dirtyRect)
		updatedRect.fill()
		
		for shape in shapes {
			drawShape(shape)
		}
	}
	
	func drawShape(_ shape:Shape) {
		let shapePath = NSBezierPath()
		shapePath.move(to: shape.p1)
		shapePath.line(to: shape.p2)
		shapePath.line(to: shape.p3)
		if let lastPoint = shape.p4 {
			shapePath.line(to: lastPoint)
		}
		shapePath.close()
		NSColor.black.setStroke()
		shapePath.stroke()
	}
	
	func addTrapezoid(p1:NSPoint, p2:NSPoint, p3:NSPoint, p4:NSPoint) {
		var shape = Shape()
		shape.p1 = p1
		shape.p2 = p2
		shape.p3 = p3
		shape.p4 = p4
		shapes.append(shape)
	}
	
	func addTriangle(p1:NSPoint, p2:NSPoint, p3:NSPoint) {
		var shape = Shape()
		shape.p1 = p1
		shape.p2 = p2
		shape.p3 = p3
		shapes.append(shape)
	}
	
	func removeShapeAt(_ index:Int) {
		if index < shapes.count {
			shapes.remove(at:index)
		}
	}
	
}
