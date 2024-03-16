//
//  ExpenseListView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/6/24.
//


//import Foundation
//import SwiftUI
//
//struct ExpenseListView: View {
//    @State private var newExpenseName = ""
//    @State private var newExpenseAmount = ""
//    @State private var newExpenseDetails = ""
//    
//    @State private var showingAddExpenseSheet = false
//    
//    @Binding var expenseSources: [ExpenseSource]
//    
//    @Binding var totalProfitLoss: Double
//    
//    init(expenseSources: Binding<[ExpenseSource]>, totalProfitLoss: Binding<Double>) {
//        self._expenseSources = expenseSources
//        self._totalProfitLoss = totalProfitLoss
//    }
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(expenseSources, id: \.name) { income in
//                    VStack(alignment: .leading) {
//                        Text("\(income.name)")
//                            .font(.headline)
//                        Text("Amount: \(income.amount)")
//                        Text("Details: \(income.details)")
//                    }
//                }
//            }
//            Text("Total Expense Amount: $\(calculateProfitLoss())")
//                .padding()
//            
//            Button("Add Expense") {
//                showingAddExpenseSheet.toggle()
//            }
//            .padding()
//            .sheet(isPresented: $showingAddExpenseSheet) {
//                VStack {
//                    TextField("Name", text: $newExpenseName)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    TextField("Amount", text: $newExpenseAmount)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                        .keyboardType(.numberPad)
//                    TextField("Details", text: $newExpenseDetails)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    Button("Save") {
//                        let amount = Double(newExpenseAmount) ?? 0.0
//                        expenseSources.append(ExpenseSource(name: newExpenseName, amount: amount, details: newExpenseDetails))
//                        totalProfitLoss += amount // Update total profit/loss
//                        showingAddExpenseSheet.toggle()
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//    private func calculateProfitLoss() -> Double {
//        
//        var cp=0.0
//        
//        for source in expenseSources {
//            cp += source.amount
//        }
//        return cp
//    }
//}
//
//
//
//
//


import SwiftUI

struct ExpenseListView: View {
    @State private var newExpenseName = ""
    @State private var newExpenseAmount = ""
    @State private var newExpenseDetails = ""
    @State private var showingAddExpenseSheet = false
    
    @Binding var expenseSources: [ExpenseSource]
    @Binding var totalProfitLoss: Double
    
    @State private var selectedExpenseSource: ExpenseSource? = nil
    @State private var isShowingExpenseDetails = false
    
    init(expenseSources: Binding<[ExpenseSource]>, totalProfitLoss: Binding<Double>) {
        self._expenseSources = expenseSources
        self._totalProfitLoss = totalProfitLoss
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(expenseSources.indices, id: \.self) { index in
                        NavigationLink(destination: ExpenseDetailsView(expenseSource: $expenseSources[index])) {
                            VStack(alignment: .leading) {
                                Text("\(expenseSources[index].name)")
                                    .font(.headline)
                                Text("Amount: \(expenseSources[index].amount)")
                                Text("Details: \(expenseSources[index].details)")
                            }
                        }
                    }
                }
                
                Text("Total Expense Amount: $\(calculateProfitLoss())")
                    .padding()
                
                Button("Add Expense") {
                    showingAddExpenseSheet.toggle()
                }
                .padding()
                .sheet(isPresented: $showingAddExpenseSheet) {
                    VStack {
                        TextField("Name", text: $newExpenseName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        TextField("Amount", text: $newExpenseAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                        TextField("Details", text: $newExpenseDetails)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Save") {
                            let amount = Double(newExpenseAmount) ?? 0.0
                            expenseSources.append(ExpenseSource(name: newExpenseName, amount: amount, details: newExpenseDetails, additionalInfo: ""))
                            totalProfitLoss += amount // Update total profit/loss
                            showingAddExpenseSheet.toggle()
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    private func calculateProfitLoss() -> Double {
        var cp = 0.0
        for source in expenseSources {
            cp += source.amount
        }
        return cp
    }
}
