//
//  Budget.swift
//  Budget
//
//  Created by 廖慶麟 on 2022/7/8.
//

import Foundation

struct Budget {
    let category: BudgetCategory
    var total: Int
    var currentCost: Int {
        let test = expenses.map{ $0.value }
        print(test)
        print(test.map{ $0 }.reduce(0, +))
        return test.map{ $0 }.reduce(0, +) }
    var left: Int { total-currentCost }
    var expenses: [Expense] = []
    
    init(category: BudgetCategory, total: Int) {
        self.category = category
        self.total = total
    }
}


