//
//  IncomeDetailsView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/8/24.
//

import SwiftUI

struct IncomeDetailsView: View {
    @Binding var incomeSource: IncomeSource
    
    
    @State private var additionalInfo: String // Change this line to remove the Binding
    
    init(incomeSource: Binding<IncomeSource>) {
        self._incomeSource = incomeSource
        self._additionalInfo = State(initialValue: incomeSource.wrappedValue.additionalInfo )
    }   
    
    var body: some View {
        VStack {
            Text("Income Details")
                .font(.title)
                .padding()
            
            Form {
                Section(header: Text("Basic Information")) {
                    Text("Name: \(incomeSource.name)")
                    Text("Amount: \(incomeSource.amount)")
                    Text("Details: \(incomeSource.details)")
                }
                
                Section(header: Text("Additional Information")) {
                    TextEditor(text: $additionalInfo)
                        .frame(height: 200)
                        .padding()
                }
            }
            
            Button("Save Additional Information") {
                // Update the additional information in the income source
                incomeSource.additionalInfo = additionalInfo
              
                // Dismiss the view or perform any additional logic
            }
            .padding()
            
            Spacer()
        }
    }
}
