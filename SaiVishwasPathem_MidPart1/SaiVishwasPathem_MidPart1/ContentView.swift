//
//  ContentView.swift
//  SaiVishwasPathem_MidPart1
//
//  Created by Sai Vishwas Pathem on 3/5/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isUtilitiesViewPresented = false
    var body: some View {
        NavigationView {
            VStack {
                Text("SaiVishwasPathem_MidPart1_Family Restaurant")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding()
                Image("restaurant")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 250)
                    .padding()
                    .onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/) {
                        isUtilitiesViewPresented = true
                    }
                
                
            }
            .background(
                NavigationLink(destination: UtilitiesView(), isActive: $isUtilitiesViewPresented) {
                    EmptyView()
                }
                    .hidden()
            )
            .padding()
        }
    }
}
#Preview {
    ContentView()
}
