//
//  ContentView.swift
//  iDine
//
//  Created by Michael Camp on 7/9/21.
//

import SwiftUI

struct ContentView: View {
   
    let menu = Bundle.main.decode([MenuSection].self, from: "menu.json")
    var body: some View {
        NavigationView {
            List{
                ForEach(menu, id: \.id) { section in
                    Section(header:Text(section.name)
                            .font(.title)) {
                        ForEach(section.items) { item in
                            NavigationLink(destination: ItemDetail(item: item)) {
                            ItemRow(item: item)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Menu")
            .listStyle(GroupedListStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

