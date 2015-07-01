//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

var authenticated:Bool? = nil

if let auth = authenticated {
    if auth {
        println("Authenticated")
    }
    else {
        println("not")
    }
}
else {
    println("nill")
}

func hammingWeight(number : Int) -> (String,Int) {
    var count = 0
    var q = (Int)(number / 2)
    var d = number % 2
    var result = "" + String(d)
    if (d==1) {
        count++
    }
    while (q != 0) {
        d = q % 2
        q = (Int)(q / 2)
        if (d==1) {
            count++
        }
        result = String(d) + result
    }
    return (result,count)
}

let result = hammingWeight(11)
result.0
result.1

func makePascalTriangle(numOfRows : Int) -> ([[Int]]){
    var row : [Int];
    var rows : [[Int]];
    
    row = [1]
    rows = []
    rows.append(row)
    for nloop in 2...numOfRows {
        var innerRow = [0]
        for inner in rows[nloop-2] {
            innerRow.append(inner)
        }
        innerRow.append(0)
        var nextRow : [Int] = []
        for (var inner = 0; inner<innerRow.count-1; inner++) {
            nextRow.append(innerRow[inner]+innerRow[inner+1])
        }
        rows.append(nextRow)
    }
    
    return rows
}

let pascal = makePascalTriangle(5)






