//
//  IncomeDetailView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/6/24.
//

import Foundation
import SwiftUI

struct IncomeDetailView: View {
    @Binding var incomeSource: IncomeSource

    var body: some View {
        VStack {
            TextField("Name", text: $incomeSource.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            TextField("Amount", value: $incomeSource.amount, formatter: NumberFormatter())
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            

            Button("Delete", action: deleteIncomeSource)
                .foregroundColor(.red)
                .padding()
        }
        .navigationTitle("Income Details")
    }

    private func deleteIncomeSource() {
        // Delete the income source
        // Here you can implement your logic to delete the income source from the array
    }
}
