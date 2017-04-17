//
//  CalculateBrain.swift
//  Myprod
//
//  Created by admin on 17.04.17.
//  Copyright © 2017 admin. All rights reserved.
//

import Foundation

enum Optional<T>{
    case None
    case Some(T)
}

func multiplay(op1:Double, op2:Double)->Double{
return op1*op2
}

class CalculateBrain{
    var accumulate = 0.0
    func setOperand (operand:Double){
    accumulate = operand
    }
    
    var Operations: Dictionary<String, operation> = [
        "π" : operation.Constant(M_PI), //M_PI,
        "e" : operation.Constant(M_E), //M_E
        "√" : operation.Unary(sqrt),
        "×" : operation.Binary(multiplay),
        "=" : operation.Equals
    ]
    
    func perfomOperation (symbol:String){
        if let operation = Operations[symbol]{
            switch operation {
            case .Constant(let Value): accumulate = Value
            case .Unary(let fun): accumulate = fun(accumulate)
            case .Binary(let fun):
                executeEquals()
                pending = pendingBinOpInfo(banaryOperation: fun, firstOperand: accumulate)
            case .Equals: executeEquals() 


            }
        }
    }
    
    func executeEquals(){
        if pending != nil {
            accumulate = pending!.banaryOperation(pending!.firstOperand, accumulate)
            pending = nil
        }
    
    }
    
    var pending : pendingBinOpInfo?
    
    struct pendingBinOpInfo {
        var banaryOperation:(Double,Double)->Double
        var firstOperand : Double
    }
    
    enum operation {
        case Constant(Double)
        case Unary((Double)->Double)
        case Binary((Double,Double)->Double)
        case Equals
    }
    
    var result:Double{
        get {
            return accumulate
        }
    
    }

}
