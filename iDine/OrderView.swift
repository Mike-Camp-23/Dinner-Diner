//
//  OrderView.swift
//  iDine
//
//  Created by Michael Camp on 7/9/21.
//

import SwiftUI

struct OrderView: View {
    @EnvironmentObject var order: Order
    var body: some View {
        NavigationView {
            List{
                Section {
                    ForEach(order.items) { item in
                        HStack {
                            Text(item.name)
                            Spacer()
                            Text("$\(item.price)")
                        }
                        
                    }
                    .onDelete(perform: deleteItems(at:))
                    
                }
                Section {
                    NavigationLink(destination:
                        CheckoutView()) {
                        Text("Place order")
                    }
                }
                .disabled(order.items.isEmpty)
            }
            .navigationTitle("Order")
            .listStyle(InsetGroupedListStyle())
            .toolbar(content: {
                EditButton()
            })
        }
    }
    func deleteItems(at offset: IndexSet) {
        order.items.remove(atOffsets: offset)
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
                }
}
