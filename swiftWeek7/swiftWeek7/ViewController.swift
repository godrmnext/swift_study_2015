//
//  ViewController.swift
//  swiftWeek7
//
//  Created by Jung Kim on 8/11/15.
//  Copyright © 2015 NHN NEXT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        func printIntKinds(numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case .Negative:
                    print("- ", appendNewLine: false)
                case .Zero:
                    print("0 ", appendNewLine: false)
                case .Positive:
                    print("+ ", appendNewLine: false)
                    
                }
            }
            print("")
        }
        
        let numbers : [Int] = [3, 19, -27, 0, -6, 0, 7]
        printIntKinds(numbers)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

