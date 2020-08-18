//
//  TipCalc.swift
//  Tip
//
//  Created by Victor Miezah on 8/17/20.
//

import Foundation

class TipCalc {
    var bill : Double = 0
    var tip : Double = 0
    var percent : Double = 0
    var total : Double = 0
    
    init(bill:Double, percent:Double) {
        self.bill = bill
        self.percent = percent
    }
    func calculate() {
        tip = bill * percent
        total = tip + bill
    }
}
