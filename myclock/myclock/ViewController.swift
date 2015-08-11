//
//  ViewController.swift
//  myclock
//
//  Created by Jung Kim on 7/7/15.
//  Copyright © 2015 nhnnext. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    var clock_timer : NSTimer?
    var hourLabelList : [NSTextField] = []
    var minuteLabelList : [NSTextField] = []
    var secondLabelList : [NSTextField] = []

    @IBOutlet weak var label11: NSTextField!
    @IBOutlet weak var label12: NSTextField!
    @IBOutlet weak var label13: NSTextField!
    @IBOutlet weak var label14: NSTextField!
    @IBOutlet weak var label15: NSTextField!
    @IBOutlet weak var label16: NSTextField!
    
    @IBOutlet weak var label21: NSTextField!
    @IBOutlet weak var label22: NSTextField!
    @IBOutlet weak var label23: NSTextField!
    @IBOutlet weak var label24: NSTextField!
    @IBOutlet weak var label25: NSTextField!
    @IBOutlet weak var label26: NSTextField!
    
    @IBOutlet weak var label31: NSTextField!
    @IBOutlet weak var label32: NSTextField!
    @IBOutlet weak var label33: NSTextField!
    @IBOutlet weak var label34: NSTextField!
    @IBOutlet weak var label35: NSTextField!
    @IBOutlet weak var label36: NSTextField!
    
    @IBOutlet weak var label41: NSTextField!
    @IBOutlet weak var label42: NSTextField!
    @IBOutlet weak var label43: NSTextField!
    @IBOutlet weak var label44: NSTextField!
    @IBOutlet weak var label45: NSTextField!
    @IBOutlet weak var label46: NSTextField!
    
    @IBOutlet weak var label51: NSTextField!
    @IBOutlet weak var label52: NSTextField!
    @IBOutlet weak var label53: NSTextField!
    @IBOutlet weak var label54: NSTextField!
    @IBOutlet weak var label55: NSTextField!
    @IBOutlet weak var label56: NSTextField!
    
    @IBOutlet weak var label61: NSTextField!
    @IBOutlet weak var label62: NSTextField!
    @IBOutlet weak var label63: NSTextField!
    @IBOutlet weak var label64: NSTextField!
    @IBOutlet weak var label65: NSTextField!
    @IBOutlet weak var label66: NSTextField!
    
    enum switchState : Int {
        case on=1, off
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        clock_timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fireTimer:"), userInfo: nil, repeats: true)

        hourLabelList = [label14, label15, label16,
                        label21, label22, label23, label24, label25, label26,
                        label31, label32, label33, label34, label35,
                        label41, label51, label52]
        
        minuteLabelList = [label42, label43, label44, label45, label46,
                        label53, label54, label55, label56,
                        label61, label62, label63, label64, label65]
    }

    override var representedObject: AnyObject? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    func switchLabelText(label: NSTextField, isOn : Bool) {
        label.textColor = (isOn) ? NSColor.blackColor() : NSColor.grayColor()
    }
    
    func processAMPM(dayComponent : NSDateComponents) {
        if (dayComponent.hour<12) {
            switchLabelText(label12, isOn:true)
            switchLabelText(label13, isOn:false)
        }
        else {
            switchLabelText(label12, isOn:false)
            switchLabelText(label13, isOn:true)
        }
    }
    
    func processHour(dayComponent : NSDateComponents) {
        for label in hourLabelList {
            switchLabelText(label, isOn:false)
        }
        
        let hour = (dayComponent.hour>12) ? dayComponent.hour - 12 : dayComponent.hour
        let tenValue = hour / 10
        let digitValue = hour % 10
        
        switch (tenValue, digitValue) {
            case (0, 0):
                switchLabelText(label41, isOn:true)
                switchLabelText(label51, isOn:true)
            case (1, _):
                switchLabelText(label14, isOn:true)
            case (1, 2):
                switchLabelText(label51, isOn:true)
                switchLabelText(label42, isOn:true)
            default:
                switchLabelText(label36, isOn:false)
        }
        switch (tenValue, digitValue) {
            case (_, 1):
                switchLabelText(label15, isOn:true)
            case (_, 2):
                switchLabelText(label16, isOn:true)
            case (0, 3):
                switchLabelText(label21, isOn:true)
            case (0, 4):
                switchLabelText(label31, isOn:true)
            case (0, 5):
                switchLabelText(label24, isOn:true)
                switchLabelText(label26, isOn:true)
            case (0, 6):
                switchLabelText(label25, isOn:true)
                switchLabelText(label26, isOn:true)
            case (0, 7):
                switchLabelText(label22, isOn:true)
                switchLabelText(label23, isOn:true)
            case (0, 8):
                switchLabelText(label32, isOn:true)
                switchLabelText(label33, isOn:true)
            case (0, 9):
                switchLabelText(label34, isOn:true)
                switchLabelText(label35, isOn:true)
            default:
                switchLabelText(label36, isOn:false)
            
        }
        switchLabelText(label36, isOn:true)
        
    }

    func processMinute(dayComponent : NSDateComponents) {
        for label in minuteLabelList {
            label.textColor = NSColor.grayColor()
        }
        
        let tenValue = dayComponent.minute / 10
        let digitValue = dayComponent.minute % 10

        switch (tenValue, digitValue) {
            case (1, _):
                switchLabelText(label46, isOn:true)
            case (2, _):
                switchLabelText(label42, isOn:true)
                switchLabelText(label46, isOn:true)
            case (3, _):
                switchLabelText(label43, isOn:true)
                switchLabelText(label46, isOn:true)
            case (4, _):
                switchLabelText(label44, isOn:true)
                switchLabelText(label46, isOn:true)
            case (5, _):
                switchLabelText(label45, isOn:true)
                switchLabelText(label46, isOn:true)
            default:
                switchLabelText(label65, isOn:false)
        }
        switch (tenValue, digitValue) {
            case (_, 1):
                switchLabelText(label53, isOn:true)
            case (_, 2):
                switchLabelText(label54, isOn:true)
            case (_, 3):
                switchLabelText(label55, isOn:true)
            case (_, 4):
                switchLabelText(label56, isOn:true)
            case (_, 5):
                switchLabelText(label52, isOn:true)
            case (_, 6):
                switchLabelText(label61, isOn:true)
            case (_, 7):
                switchLabelText(label62, isOn:true)
            case (_, 8):
                switchLabelText(label63, isOn:true)
            case (_, 9):
                switchLabelText(label64, isOn:true)
            default:
                switchLabelText(label65, isOn:false)
        }
        switchLabelText(label65, isOn:true)
    }

    func processSecond(dayComponent : NSDateComponents) {
        NSAnimationContext.beginGrouping()
        NSAnimationContext.currentContext().duration = 0.5
        label66.cell?.integerValue = dayComponent.second
        NSAnimationContext.endGrouping()
    }

    func fireTimer(aTimer : NSTimer) {
        let gregorian = NSCalendar.currentCalendar()
        let dayComponents = gregorian.components([.Hour, .Minute, .Second], fromDate: NSDate());
        
        print("\(dayComponents)")
        processAMPM(dayComponents)
        processHour(dayComponents)
        processMinute(dayComponents)
        processSecond(dayComponents)
    }

}

