//
//  ExpenseDetailsView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/9/24.
//

import Foundation
import SwiftUI

struct ExpenseDetailsView: View {
    @Binding var expenseSource: ExpenseSource
    
    
    @State private var additionalInfo: String // Change this line to remove the Binding
    
    init(expenseSource: Binding<ExpenseSource>) {
        self._expenseSource = expenseSource
        self._additionalInfo = State(initialValue: expenseSource.wrappedValue.additionalInfo )
    }
    
    var body: some View {
        VStack {
            Text("Expense Details")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Basic Information")) {
                    Text("Name: \(expenseSource.name)")
                    Text("Amount: \(expenseSource.amount)")
                    Text("Details: \(expenseSource.details)")
                }
                
                Section(header: Text("Additional Information / Notes")) {
                    TextEditor(text: $additionalInfo)
                        .frame(height: 200)
                        .padding()
                }
            }
            
            Button("Save Additional Information") {
                // Update the additional information in the income source
                expenseSource.additionalInfo = additionalInfo
              
                // Dismiss the view or perform any additional logic
            }
            .padding()
            
            Spacer()
        }
    }
}
