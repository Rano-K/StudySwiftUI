//
//  NumberFormatter+Ext.swift
//  PFinance
//
//  Created by Simon Ng on 7/8/2023.
//

import Foundation

extension NumberFormatter {
    static func currency(from value: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        
        
        let formattedValue = formatter.string(from: NSNumber(value: value)) ?? ""
        
        return "₩" + formattedValue
    }
}
