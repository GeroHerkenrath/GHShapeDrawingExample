//
//  ViewController.swift
//  GHShapeDrawingExample
//
//  Created by Gero Herkenrath on 21/10/2016.
//  Copyright © 2016 Gero Herkenrath. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

	override func viewDidLoad() {
		super.viewDidLoad()

		// Do any additional setup after loading the view.
	}

	override var representedObject: Any? {
		didSet {
		// Update the view, if already loaded.
		}
	}
	
	// first Shape
	let pointA1 = NSMakePoint(115.0, 10.0)
	let pointA2 = NSMakePoint(140.0, 10.0)
	let pointA3 = NSMakePoint(150.0, 40.0)
	let pointA4 = NSMakePoint(110.0, 40.0)
	
	// second Shape
	let pointB1 = NSMakePoint(230.0, 10.0)
	let pointB2 = NSMakePoint(260.0, 40.0)
	let pointB3 = NSMakePoint(200.0, 40.0)
	
	// thirdShape
	let pointC1 = NSMakePoint(115.0, 110.0)
	let pointC2 = NSMakePoint(140.0, 110.0)
	let pointC3 = NSMakePoint(150.0, 140.0)
	let pointC4 = NSMakePoint(110.0, 140.0)
	

	@IBOutlet weak var shapeHolderView: GHShapeDemoView!
	
	@IBAction func newTrapezoid(_ sender: AnyObject) {
		if shapeHolderView.shapes.count < 1 {
			shapeHolderView.addTrapezoid(p1: pointA1, p2: pointA2, p3: pointA3, p4: pointA4)
		} else {
			shapeHolderView.addTrapezoid(p1: pointC1, p2: pointC2, p3: pointC3, p4: pointC4)
		}
		shapeHolderView.setNeedsDisplay(shapeHolderView.bounds)
	}

	@IBAction func newTriangle(_ sender: AnyObject) {
		shapeHolderView.addTriangle(p1: pointB1, p2: pointB2, p3: pointB3)
		shapeHolderView.setNeedsDisplay(shapeHolderView.bounds)
	}
	
	@IBAction func removeLastShape(_ sender: AnyObject) {
		if shapeHolderView.shapes.count > 0 {
			shapeHolderView.removeShapeAt(shapeHolderView.shapes.count - 1)
			shapeHolderView.setNeedsDisplay(shapeHolderView.bounds)
		}
	}
}

