//
//  MathOperationEnum.swift
//  RUAZOSI_2018_projekt
//
//  Created by Ivana Mrsic on 06/07/2018.
//  Copyright © 2018 Lea Rački. All rights reserved.
//

import Foundation

enum MathOperation {
    case addition
    case subtraction
    case multiplication
    case division
    
    static func chooseRandomOperation() -> MathOperation {
        let chooseRandomOperation = arc4random() % 4
        switch chooseRandomOperation {
        case 0:
            return .addition
        case 1:
            return .subtraction
        case 2:
            return .multiplication
        case 3:
            return .division
        default:
            return .addition
        }
    }
    
    static func calculate(first: Int, second: Int, mathOperator: MathOperation) -> Double{
        switch mathOperator {
        case .addition:
            return Double(first + second)
        case .subtraction:
            return Double(first - second)
        case .multiplication:
            return Double(first * second)
        case .division:
            return Double(first) / Double(second)
        }
    }
    
    var mathOperator: String {
        switch self {
        case .addition:
            return "+"
        case .subtraction:
            return "-"
        case .multiplication:
            return "*"
        case .division:
            return "/"
        }
    }
}
