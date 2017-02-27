//
//  TipModel.swift
//  tipscalculator
//
//  Created by jakub skrzypczynski on 24/02/2017.
//  Copyright © 2017 test project. All rights reserved.
//

import Foundation

class TipModel {
    private var _billAmount: Double = 0
    private var _tipPercent: Double = 0
    private var _tipAmount: Double = 0
    private var _totalAmount: Double = 0
    private var _splitTotalAmount: Double = 0
    private var _splitAmount: Double = 0
    
    
    var billAmount: Double {
        get {
            return _billAmount
        } set {
            _billAmount = newValue
        }
    }
    
    
    var tipPercent: Double {
        get {
            return _tipPercent
        } set {
            _tipPercent = newValue
        }
    }
    
    var splitTotalAmount: Double {
        get {
            return _splitTotalAmount
        } set {
            _splitTotalAmount = newValue
        }
    }
    
    var splitAmount: Double {
        
        return _splitAmount
    }
    
    var tipAmount: Double {
        
            return _tipAmount
        
    }
    
    var totalAmount: Double {
        return _totalAmount
        
    }
    
    init(billAmount: Double, tipPercent: Double, splitAmount: Double ){
        self._billAmount = billAmount
        self._tipPercent = tipPercent
        self._splitAmount = splitAmount
    }
    
    func calculateTip() {
        _tipAmount = billAmount * tipPercent
        _totalAmount = billAmount + tipAmount
    }
    
    func calculateSplit() {
        _splitTotalAmount = totalAmount / splitAmount
        
    }
    
    
    
}
