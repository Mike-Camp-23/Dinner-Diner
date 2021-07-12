//
//  ItemDetail.swift
//  iDine
//
//  Created by Michael Camp on 7/9/21.
//

import SwiftUI

struct ItemDetail: View {
    @EnvironmentObject var order: Order
    let colors: [String: Color] = ["D": .purple, "G": .black, "N": .red, "S": .blue, "V": .green]
    var item: MenuItem
    var body: some View {
        VStack {
            
            ZStack(alignment: .bottomTrailing) {
                Image(item.mainImage)
                    .resizable()
                    .scaledToFit()
                Text("Photo: \(item.photoCredit)")
                    .padding(4)
                    .background(Color.black)
                    .font(.caption)
                    .foregroundColor(.white)
                    .offset(x: -5, y: -5)
            }
            
            Text(item.description)
                .padding()
            HStack() {
//               Spacer()
                VStack() {
                    ForEach(item.restrictions, id: \.self) { restriction in
                        Text(restriction)
                            .font(.caption)
                            .fontWeight(.black)
                            .padding(6)
                            .background(colors[restriction, default: .black])
                            .clipShape(Circle())
                            .foregroundColor(.white)
                    }
                    
                    .padding(.leading)
                }
                Spacer()
            }
            Button(action: {
                order.add(item: item)
            }) {
                Text("Order this")
            }
            
            Spacer()
        }
        .navigationTitle(item.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ItemDetail_Previews: PreviewProvider {
    static var previews: some View {
        
        NavigationView {
            ItemDetail(item: MenuItem.example)
                .environmentObject(Order())
        }
    }
}
