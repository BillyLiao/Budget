//
//  BudgetManager.swift
//  Budget
//
//  Created by 廖慶麟 on 2022/7/8.
//

import Foundation

protocol BudgetManagerProtocal {
    func add(_ budget: Budget)
    func addNewExpense(_ expense: Int, to category: BudgetCategory) -> Expense?
    func removeExpense(_ expenseID: String, from category: BudgetCategory)
}

class BudgetManager: BudgetManagerProtocal {
    public private(set) var budgets: [Budget] = []
    
    func add(_ budget: Budget) {
        guard budgets.filter{ $0.category == budget.category }.first == nil else { return }
        budgets.append(budget)
    }
    
    @discardableResult func addNewExpense(_ expense: Int, to category: BudgetCategory) -> Expense? {
        guard let index = budgets.firstIndex(where: { $0.category == category }) else { return nil }
        let expense = Expense(expense)
        budgets[index].expenses.append(expense)
        return expense
    }
    
    func removeExpense(_ expenseID: String, from category: BudgetCategory) {
        guard let index = budgets.firstIndex(where: { $0.category == category }) else { return }
        budgets[index].expenses.removeAll(where: { $0.id == expenseID })
    }
    
    private func get(_ category: BudgetCategory) -> Budget? {
        budgets.filter{ $0.category == category }.first
    }
}
