//
//  iDineApp.swift
//  iDine
//
//  Created by Michael Camp on 7/9/21.
//

import SwiftUI

@main
struct iDineApp: App {
    @StateObject var order = Order()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(order)
        }
    }
}
