//
//  AddView.swift
//  iExpense
//
//  Created by Luka Managadze on 7/26/25.
//

import SwiftUI

struct AddView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var amount = 0.0
    @State var chooseCurrency = "USD"
    
    @FocusState private var amountIsFocused: Bool
    
    var expenses: Expenses
    
    let types = ["Personal", "Business"]
    var body: some View {
        NavigationStack {
            Form {
                TextField("Expense type...", text: $name)
                    .keyboardType(.alphabet)
                    .autocorrectionDisabled()
                    .focused($amountIsFocused)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                Section("CHOOSE YOUR PREFERRED CURRENCY") {
                    Picker("Choose your preferred currency", selection: $chooseCurrency) {
                        Text("USD").tag("USD")
                        Text("EUR").tag("EUR")
                    }
                }
                .pickerStyle(.segmented)
                TextField("Amount", value: $amount, format: .currency(code: chooseCurrency))
                    .keyboardType(.decimalPad)
                    .focused($amountIsFocused)
            }
        .navigationTitle("Add an expense")
        .preferredColorScheme(.dark)
        .toolbar {
            Button("Save") {
                let item = ExpenseItem(name: name, type: type, amount: amount, currency: chooseCurrency)
                expenses.items.append(item)
                dismiss()
                
              }
            .foregroundStyle(.white)
           }
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                Spacer()
                Button("Done") {
                    amountIsFocused = false
                  }
               }
            }
        }
    }
}

#Preview {
    AddView(expenses: Expenses())
}
