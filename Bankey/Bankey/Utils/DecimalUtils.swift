//
//  DecimalUtils.swift
//  Bankey
//
//  Created by Chandan on 10/01/23.
//

import Foundation
extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal:self).doubleValue
    }
}
