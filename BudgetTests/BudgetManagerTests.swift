//
//  BudgetManagerTests.swift
//  BudgetTests
//
//  Created by 廖慶麟 on 2022/7/8.
//

import XCTest

@testable import Budget


class BudgetManagerTests: XCTestCase {
    
    var manager = BudgetManager()

    override func setUpWithError() throws {
        continueAfterFailure = false
        manager = BudgetManager()
        manager.add(Budget(category: .Grocery, total: 8000))
    }

    override func tearDownWithError() throws {
    }
    
    func testAddBudget() throws {
        let groceryBudget = manager.budgets.filter{ $0.category == .Grocery }.first
        XCTAssertNotNil(groceryBudget)
        XCTAssert(groceryBudget!.total == 8000)
    }
    
    func testAddExpense() throws {
        manager.addNewExpense(100, to: .Grocery)
        let budget = manager.budgets.filter{ $0.category == .Grocery }.first
        XCTAssert(budget!.expenses.count == 1)
        XCTAssert(budget!.expenses.first!.value == 100)
    }
    
    func testRemoveExpense() throws {
        let expense = manager.addNewExpense(100, to: .Grocery)
        manager.removeExpense(expense!.id, from: .Grocery)
        let budget = manager.budgets.filter{ $0.category == .Grocery }.first
        XCTAssert(budget!.expenses.count == 0)
    }
    
    func testLeftCalculation() throws {
        manager.addNewExpense(100, to: .Grocery)
        let budget = manager.budgets.filter{ $0.category == .Grocery }.first
        XCTAssert(budget!.left == 7900)
    }
    
    func testCurrentCostCalculation() throws {
        manager.addNewExpense(100, to: .Grocery)
        let budget = manager.budgets.filter{ $0.category == .Grocery }.first
        XCTAssert(budget!.currentCost == 100)
    }
    
    func testCategoryDuplication() throws {
        manager.add(Budget(category: .Grocery, total: 8000))
        manager.add(Budget(category: .Grocery, total: 8000))
        XCTAssert(manager.budgets.count == 1)
    }    
}

