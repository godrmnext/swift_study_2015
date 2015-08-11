//
//  swiftWeek7Tests.swift
//  swiftWeek7Tests
//
//  Created by Jung Kim on 8/11/15.
//  Copyright © 2015 NHN NEXT. All rights reserved.
//

import XCTest
@testable import swiftWeek7

class swiftWeek7Tests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let spadeAce = BlackjackCard(rank: .Ace, suit: .Spades)
        XCTAssertEqual(spadeAce.rank.values.first, 1)
        XCTAssertEqual(spadeAce.rank.values.second, 11)
        
        let clubJack = BlackjackCard(rank: .Jack, suit: .Clubs)
        XCTAssertEqual(clubJack.rank.values.first, 10)
        XCTAssertNil(clubJack.rank.values.second)
    }
    
    func testDoubleExtension() {
        let oneInch = 25.4.mm
        XCTAssertEqual(oneInch, 0.0254)
        let threeFeet = 3.ft
        XCTAssertEqual(threeFeet, 0.914399970739201)
    }
    
    func testIntExtension() {
        XCTAssertEqual(746381295[0], 5)
        XCTAssertEqual(746381295[1], 9)
        XCTAssertEqual(746381295[2], 2)
        XCTAssertEqual(746381295[8], 7)
        XCTAssertEqual(746381295[9], 0)
    }
    
    func testIntKind() {
//        let number : Int = -123
//        XCTAssertEqual((-123).kind, Int.Kind.Negative)
//        XCTAssertEqual((0).kind, Int.Kind.Zero)
//        XCTAssertEqual((123).kind, Int.Kind.Positive)
        let numbers : [Int] = [3, 19, -27, 0, -6, 0, 7]
        func printIntKinds(numbers: [Int]) {
            for number in numbers {
                switch number.kind {
                case Int.Kind.Negative:
                    print("- ", appendNewLine: false)
                case Int.Kind.Zero:
                    print("0 ", appendNewLine: false)
                case Int.Kind.Positive:
                    print("+ ", appendNewLine: false)
                    
                }
            }
            print("")
        }
        printIntKinds(numbers)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
