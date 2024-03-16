//
//  UtilitiesView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/5/24.
//

import SwiftUI

struct UtilitiesView: View {
    // Dummy values for demonstration
    @State private var isLoadingImage1 = true
    @State private var isLoadingImage2 = true
    @State private var isLoadingImage3 = true
    @State private var isLoadingImages = true
    @State private var isImage1Loaded = false
    @State private var isImage2Loaded = false
    @State private var isImage3Loaded = false
    @State private var isincomeButton = false
    @State private var isExpenseButton = false
    @State private var totalProfitLoss: Double = 0.0 // Add this line

         
    // @State private var isLoadingImages = true
    @State private var isProfitable:Bool=false
    @State private var noprofitloss:Bool=true
    
    
    @State private var incomeSources: [IncomeSource] = [//Adding 5 income sources
        IncomeSource(name: "Food Sales", amount: 2,details: "It is Food related",additionalInfo: ""),
        IncomeSource(name: "Beverage Sales", amount: 1, details: "It is Beverage related",additionalInfo: ""),
        IncomeSource(name: "Event Bookings", amount: 1,details: "It is event related",additionalInfo: ""),
        IncomeSource(name: "Customer Sales", amount: 1,details: "It is Customer related",additionalInfo: ""),
        IncomeSource(name: "Booking Sales", amount: 1,details: "It is Booking related",additionalInfo: "")


    ]
    @State private var expenseSources: [ExpenseSource] = [//Adding 5 expense sources
        ExpenseSource(name: "Electricity ", amount: 1,details: "It is Electricity related",additionalInfo: ""),
        ExpenseSource(name: "Transport Sales", amount: 1,details: "It is Transport related",additionalInfo: ""),
        ExpenseSource(name: "Salary Bookings", amount: 1,details: "It is Salary related",additionalInfo: ""),
        ExpenseSource(name: "Maintanace", amount: 1,details: "It is Maintanace related",additionalInfo: ""),
        ExpenseSource(name: "Rent", amount: 1,details: "It is Rent related",additionalInfo: "")
    ]

    var body: some View {
        NavigationView {
            VStack {
                Text("Utilities")
                    .font(.title)
                    .fontWeight(.bold)
                    .padding()
                
                // Async image loading with progress indicator
                Group {
                    if isLoadingImages {
                        ProgressView("Loading images...")
                            .padding()
                    } else {
                        Text("Images loaded successfully!")
                            .padding()
                    }
                }
                loadImage(from: "https://upload.wikimedia.org/wikipedia/commons/d/d0/M_Letter_LZNQBD.jpg")
                
                // Load Image 2
                loadImage(from: "https://upload.wikimedia.org/wikipedia/commons/1/17/Letter_A.jpg")
                
                // Load Image 3
                loadImage(from: "https://img.freepik.com/premium-photo/fire-alphabet-letter-d-isolated-black-background_564276-8941.jpg?w=1380")
                
                Spacer()
                // Display current profit/loss percentage
                Text("Profit/Loss: $\(calculateProfitLoss()) (\(calculateProfitLossPercentage())%)")
                    .foregroundColor(profitLossColor())
                    .padding()
                
                // View and modify income
                Button(action: {
                    isincomeButton=true
                    
                    // Navigate to view and modify income screen
                    // You can implement navigation here
                }) {
                    Text("View and Modify Income")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                .padding()
                
                // NavigationLink to IncomeView
                NavigationLink(destination: IncomeListView(incomeSources: $incomeSources, totalProfitLoss: $totalProfitLoss), isActive: $isincomeButton) {
                    EmptyView() // Placeholder, navigation happens programmatically
                }
                        .hidden()
                
                // View and modify expenses
                Button(action: {
                    isExpenseButton=true
                    // Navigate to view and modify expenses screen
                    // You can implement navigation here
                }) {
                    Text("View and Modify Expenses")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                    
                }
                Spacer()
                
                    .padding()
                    .onChange(of: isLoadingImages) { _ in
                        isLoadingImages = false
                    }
                
                    .padding()
NavigationLink(destination: ExpenseListView(expenseSources: $expenseSources, totalProfitLoss: $totalProfitLoss), isActive: $isExpenseButton) {
                    EmptyView() // Placeholder, navigation happens programmatically
                }
                .hidden()
            }
        }
    }

    // Calculate total profit or loss
    private func calculateProfitLoss() -> Double {
        var total = 0.0
        var sp=0.0
        var cp=0.0
        for source in incomeSources {
            sp += source.amount
        }
        
        for source in expenseSources {
            cp += source.amount
        }
        
        if sp > cp{
            print("isProfitable=true")
            isProfitable=true
            noprofitloss=false
            total=sp-cp
        }
        else if(sp==cp){
            print("noprofitloss=true")
            noprofitloss=true
            isProfitable=false
            total=sp-cp
        }
        else{
            print("isProfitable=false")
            isProfitable=false
            noprofitloss=false
             total=cp-sp
        }
        totalProfitLoss=total
        print("From calculate function")
        print("total = ", total)
        print("totalProfitLoss = ",$totalProfitLoss)
        return total
    }

    // Calculate profit or loss percentage
    private func calculateProfitLossPercentage() -> Double {
        var cp=0.0
        for source in expenseSources {
            cp += source.amount
        }
        let total = calculateProfitLoss()
        print(total)
        let percentage = ((total / cp) * 100).rounded()
        return percentage
    }

    // Determine text color based on profit or loss
    private func profitLossColor() -> Color {
        print("From color function")
        var total = 0.0
        var sp=0.0
        var cp=0.0
        for source in incomeSources {
            sp += source.amount
        }
        
        for source in expenseSources {
            cp += source.amount
        }
        print(isProfitable)
        if sp==cp {
            print("Blueing")
            return .blue
        }
        if sp>cp {
            print("Greening")
            return .green
        } else {
            print("Reding")
            return .red
        }
    }
    private func loadImage(from url: String) -> some View {
            AsyncImage(url: URL(string: url)) { phase in
                switch phase {
                case .empty:
                    if !isLoadingImages {
                        ProgressView("Loading image...")
                    } else {
                        EmptyView()
                    }
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 75, height: 75)
                        .padding()
                case .failure:
                    Text("Failed to load image")
                @unknown default:
                    EmptyView()
                }
            }
            .onAppear {
                isLoadingImages = false
            }
        }

        // Function to asynchronously load image from URL
        private func loadImage(from url: String, isLoading: Binding<Bool>) {
            guard let imageURL = URL(string: url) else { return }
            let task = URLSession.shared.dataTask(with: imageURL) { data, _, _ in
                if let _ = data {
                    // Assume data is loaded successfully
                    DispatchQueue.main.async {
                        isLoading.wrappedValue = false
                    }
                }
            }
            task.resume()
        }
}

// Dummy data structure for income source
struct IncomeSource {
    var name: String
    var amount: Double
    var details: String
    var additionalInfo:String
}


struct ExpenseSource {
    var name: String
    var amount: Double
    var details: String
    var additionalInfo:String
}
