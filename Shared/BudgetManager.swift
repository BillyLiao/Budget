//
//  BudgetManager.swift
//  Budget
//
//  Created by 廖慶麟 on 2022/7/8.
//

import Foundation

protocol BudgetManagerProtocal {
    var budgets: [Budget] { get set }
    
    func addNewExpense(_ expense: Int, to category: BudgetCategory)
    func removeExpense(_ expenseID: String, from category: BudgetCategory)
}

class BudgetManager: BudgetManagerProtocal {
    var budgets: [Budget] = []
    
    func addNewExpense(_ expense: Int, to category: BudgetCategory) {
        guard var budget = get(category) else { return }
        budget.expenses.append(.init(value: expense))
    }
    
    func removeExpense(_ expenseID: String, from category: BudgetCategory) {
        guard var budget = get(category) else { return }
        budget.expenses.removeAll(where: { $0.id == expenseID })
    }
    
    private func get(_ category: BudgetCategory) -> Budget? {
        return budgets.filter{ $0.category == category}.first
    }
}
