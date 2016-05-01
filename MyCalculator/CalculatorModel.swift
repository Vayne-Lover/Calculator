//
//  CalculatorModel.swift
//  MyCalculator
//
//  Created by 姜况童 on 16/4/17.
//  Copyright © 2016年 姜况童. All rights reserved.
//

import Foundation
class CalculatorModel{
    func evaluate(temp:(Double,Double,String)) -> (Double,Double,String) {
        var inTemp:(Double,Double,String)=temp
        switch temp.2 {
        case "+":
            inTemp.0=temp.0+temp.1
        case "−":
            inTemp.0=temp.0-temp.1
        case "×":
            inTemp.0=temp.0*temp.1
        case "÷":
//            if inTemp.1==0{
//                inTemp=(0,0,"+")//shuchu
//                print("Can't /0")
//                return inTemp
//            } else {
//                inTemp.0=temp.0/temp.1
//            }
            inTemp.0=temp.0/temp.1
        default:
            break
        }
        return inTemp
    }
}