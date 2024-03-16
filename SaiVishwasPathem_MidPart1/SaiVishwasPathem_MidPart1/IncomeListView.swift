//
//  IncomeListView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/6/24.
//

//import SwiftUI
//struct IncomeListView: View {
//    @State private var newIncomeName = ""
//    @State private var newIncomeAmount = ""
//    @State private var newIncomeDetails = ""
//    
//    @State private var showingAddIncomeSheet = false
//    
//    @Binding var incomeSources: [IncomeSource]
//    
//    @Binding var totalProfitLoss: Double
//    
//    init(incomeSources: Binding<[IncomeSource]>, totalProfitLoss: Binding<Double>) {
//        self._incomeSources = incomeSources
//        self._totalProfitLoss = totalProfitLoss
//    }
//    
//    var body: some View {
//        VStack {
//            List {
//                ForEach(incomeSources, id: \.name) { income in
//                    VStack(alignment: .leading) {
//                        Text("\(income.name)")
//                            .font(.headline)
//                        Text("Amount: \(income.amount)")
//                        Text("Details: \(income.details)")
//                    }
//                }
//            }
//            Text("Total Income Amount: $\(calculateProfitLoss())")
//                .padding()
//            
//            Button("Add Income") {
//                showingAddIncomeSheet.toggle()
//            }
//            .padding()
//            .sheet(isPresented: $showingAddIncomeSheet) {
//                VStack {
//                    TextField("Name", text: $newIncomeName)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    TextField("Amount", text: $newIncomeAmount)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                        .keyboardType(.numberPad)
//                    TextField("Details", text: $newIncomeDetails)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//                        .padding()
//                    Button("Save") {
//                        let amount = Double(newIncomeAmount) ?? 0.0
//                        incomeSources.append(IncomeSource(name: newIncomeName, amount: amount, details: newIncomeDetails))
//                        totalProfitLoss += amount // Update total profit/loss
//                        showingAddIncomeSheet.toggle()
//                    }
//                    .padding()
//                }
//            }
//        }
//    }
//    private func calculateProfitLoss() -> Double {
//        
//        var sp=0.0
//        
//        for source in incomeSources {
//            sp += source.amount
//        }
//        return sp
//    }
//}





//
//
//import Foundation
//import SwiftUI
//struct IncomeListView: View {
//    @State private var newIncomeName = ""
//    @State private var newIncomeAmount = ""
//    @State private var newIncomeDetails = ""
//    @State private var showingAddIncomeSheet = false
//    
//    @Binding var incomeSources: [IncomeSource]
//    @Binding var totalProfitLoss: Double
//    
//    @State private var selectedIncomeSource: IncomeSource? = nil
//    @State private var isShowingIncomeDetails = false
//    
//    init(incomeSources: Binding<[IncomeSource]>, totalProfitLoss: Binding<Double>) {
//        self._incomeSources = incomeSources
//        self._totalProfitLoss = totalProfitLoss
//    }
//    
//    var body: some View {
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(incomeSources, id: \.name) { income in
//                        NavigationLink(destination: IncomeDetailsView(incomeSource: .constant(income)))
//                        {
//                            VStack(alignment: .leading) {
//                                Text("\(income.name)")
//                                    .font(.headline)
//                                Text("Amount: \(income.amount)")
//                                Text("Details: \(income.details)")
//                            }
//                        }
//                    }
//                }
//                
//                Text("Total Income Amount: $\(calculateProfitLoss())")
//                    .padding()
//                
//                Button("Add Income") {
//                    showingAddIncomeSheet.toggle()
//                }
//                .padding()
//                .sheet(isPresented: $showingAddIncomeSheet) {
//                    
//                    VStack {
//                        TextField("Name", text: $newIncomeName)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                        TextField("Amount", text: $newIncomeAmount)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                            .keyboardType(.numberPad)
//                        TextField("Details", text: $newIncomeDetails)
//                            .textFieldStyle(RoundedBorderTextFieldStyle())
//                            .padding()
//                        Button("Save") {
//                            let amount = Double(newIncomeAmount) ?? 0.0
//    incomeSources.append(IncomeSource(name: newIncomeName, amount: amount, details: newIncomeDetails,additionalInfo: ""))
//                            totalProfitLoss += amount // Update total profit/loss
//                            showingAddIncomeSheet.toggle()
//                        }
//                        .padding()
//                    }
//                }
//            }
//        }
//    }
//    
//    private func calculateProfitLoss() -> Double {
//        var sp = 0.0
//        for source in incomeSources {
//            sp += source.amount
//        }
//        return sp
//    }
//}




import SwiftUI

struct IncomeListView: View {
    @State private var newIncomeName = ""
    @State private var newIncomeAmount = ""
    @State private var newIncomeDetails = ""
    @State private var showingAddIncomeSheet = false
    
    @Binding var incomeSources: [IncomeSource]
    @Binding var totalProfitLoss: Double
    
    @State private var selectedIncomeSource: IncomeSource? = nil
    @State private var isShowingIncomeDetails = false
    
    init(incomeSources: Binding<[IncomeSource]>, totalProfitLoss: Binding<Double>) {
        self._incomeSources = incomeSources
        self._totalProfitLoss = totalProfitLoss
    }

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(incomeSources.indices, id: \.self) { index in
                        NavigationLink(destination: IncomeDetailsView(incomeSource: $incomeSources[index])) {
                            VStack(alignment: .leading) {
                                Text("\(incomeSources[index].name)")
                                    .font(.headline)
                                Text("Amount: \(incomeSources[index].amount)")
                                Text("Details: \(incomeSources[index].details)")
                            }
                        }
                    }
                }
                
                Text("Total Income Amount: $\(calculateProfitLoss())")
                    .padding()
                
                Button("Add Income") {
                    showingAddIncomeSheet.toggle()
                }
                .padding()
                .sheet(isPresented: $showingAddIncomeSheet) {
                    VStack {
                        TextField("Name", text: $newIncomeName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        TextField("Amount", text: $newIncomeAmount)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                            .keyboardType(.numberPad)
                        TextField("Details", text: $newIncomeDetails)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button("Save") {
                            let amount = Double(newIncomeAmount) ?? 0.0
                            incomeSources.append(IncomeSource(name: newIncomeName, amount: amount, details: newIncomeDetails, additionalInfo: ""))
                            totalProfitLoss += amount // Update total profit/loss
                            showingAddIncomeSheet.toggle()
                        }
                        .padding()
                    }
                }
            }
        }
    }
    
    private func calculateProfitLoss() -> Double {
        var sp = 0.0
        for source in incomeSources {
            sp += source.amount
        }
        return sp
    }
}
