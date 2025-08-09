
struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let currency: String
}

@Observable
class Expenses {
    var items = [ExpenseItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        items = []
    }
}

import SwiftUI
struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    @State private var title = "iExpense"
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal Expenses") {
                    ForEach(personalItems) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in
                        deleteItems(offsets, from: personalItems)
                    }
                }
                Section("Business Expenses") {
                    ForEach(businessItems) { item in
                        expenseRow(for: item)
                    }
                    .onDelete { offsets in
                        deleteItems(offsets, from: businessItems)
                    }
                }
            }
            .navigationTitle($title)
            .textInputAutocapitalization(.never)
            .disableAutocorrection(true)
            .navigationBarTitleDisplayMode(.inline)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    NavigationLink(destination: AddView(expenses: expenses)) {
                        
                        Image(systemName: "plus")
                            .foregroundStyle(.white)
                        
                    }
                }
            }
        }
          }
    var personalItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Personal" }
    }
    var businessItems: [ExpenseItem] {
        expenses.items.filter { $0.type == "Business" }
    }
    
    func expenseRow (for item: ExpenseItem) -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: item.currency))
                .foregroundStyle(item.amount < 10 ? .red : (item.amount < 100) ? .yellow : .green)
        }
    }
    func deleteItems(_ offsets: IndexSet, from items: [ExpenseItem]) {
        for index in offsets {
            if let originalIndex = expenses.items.firstIndex(where: { $0.id == items[index].id}) {
                expenses.items.remove(at: originalIndex)
            }
        }
    }
    }

#Preview {
    ContentView()
}
