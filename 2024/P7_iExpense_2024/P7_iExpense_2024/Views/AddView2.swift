//
//  AddView2.swift
//  P7_iExpense_2024
//
//  Created by  Ty Vaughan on 3/6/24.
//

import SwiftUI

struct AddView2: View {
    var expenses: Expenses
    
    @Environment(\.dismiss) var dismiss
    
    @State private var name = "Expense name..."
    @State private var type = "Personal"
    @State private var amount = 0.0
    
    let types = ["Business", "Personal"]
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle($name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        addExpense()
                        dismiss()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
    
    
    func addExpense() {
        let expense = ExpenseItem(name: name, type: type, amount: amount)
        expenses.items.append(expense)
        expenses.items.sort { item1, item2 in
            // Place newly added items at the end of similar items
            if item1.type == "Personal" && item2.type == "Personal" || item1.type == "Business" && item2.type == "Business" {
                return false
            }
            
            // Place personal items go in front of business items
            if item1.type == "Personal" && item2.type == "Business" {
                return true
            } else if item1.type == "Business" && item2.type == "Personal" {
                return false
            }
            
            return true
        }
    }

}

#Preview {
    AddView2(expenses: Expenses())
}
