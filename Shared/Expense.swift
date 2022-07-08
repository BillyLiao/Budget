//
//  Expense.swift
//  Budget
//
//  Created by 廖慶麟 on 2022/7/8.
//

import Foundation

struct Expense {
    var id: String = UUID().uuidString
    var value: Int
    
    init(_ value: Int) {
        self.value = value
    }
}

