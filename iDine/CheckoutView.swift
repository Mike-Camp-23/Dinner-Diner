//
//  CheckoutView.swift
//  iDine
//
//  Created by Michael Camp on 7/12/21.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var order: Order
    @State private var paymentType = "Cash"
    @State private var addLoyaltyDetails = false
    @State private var loyaltyNumber = ""
    @State private var tipAmount = 15
    @State private var showingAlert = false
    
    let payementTypes = ["Cash", "Credit Card", "iDine Points"]
    let tipAmounts = [10, 15, 20, 25, 0]
    
    var totalPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let total = Double(order.total)
        let tipValue = total / 100 * Double(tipAmount)
        
        return formatter.string(from: NSNumber(value: total + tipValue)) ?? "$0"
    }
    
    var body: some View {
        Form {
            Section {
                Picker("How do you want to pay?", selection: $paymentType) {
                    ForEach(payementTypes, id: \.self) {
                        Text($0)
                    }
                } // Picker
           
                Toggle("Add iDine loyalty card", isOn: $addLoyaltyDetails.animation())
            if addLoyaltyDetails { TextField("Enter your iDine ID", text: $loyaltyNumber)
                .keyboardType(.numberPad)
                }
            } // Section
            Section(header: Text("Add a tip?")) {
                Picker("Would you like to leave a tip?", selection: $tipAmount) {
                    ForEach(tipAmounts, id: \.self) {
                        Text("\($0)%")
                    }
                } // Picker
                .pickerStyle(SegmentedPickerStyle())
            } // Section
            Section(header:
                        Text("TOTAL: \(totalPrice)")
                        .font(.largeTitle)
            ) {
                Button("Confirm order") {
                    showingAlert.toggle()
                }
            }
            
        } // Form
        .navigationTitle("Payment")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showingAlert) {
            Alert.init(title: Text("Order Confirmed"), message: Text("Your total was \(totalPrice)"), dismissButton: .default(Text("OK")))
        }
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView()
            .environmentObject(Order())
    }
}
