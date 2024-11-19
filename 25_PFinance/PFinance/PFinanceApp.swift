//
//  PFinanceApp.swift
//  PFinance
//
//  Created by Simon Ng on 7/8/2023.
//

import SwiftUI
import SwiftData

@main
struct PFinanceApp: App {
    var body: some Scene {
        WindowGroup {
            DashboardView()
        }
        .modelContainer(for: PaymentActivityModel.self)
    }
}
