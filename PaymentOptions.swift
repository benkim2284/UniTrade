//
//  PaymentOptions.swift
//  SwiftUIStarterKitApp
//
//  Created by Hera Chung on 10/14/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import SwiftUI

struct Option: Identifiable {
    let id = UUID()
    let name: String
}

struct PaymentOptions: View {
    @State var paymentMethods = [
            Option(name: "Venmo"),
            Option(name: "Zelle"),
            Option(name: "PayPal"),
            Option(name: "ApplePay"),
            Option(name: "Cash")
        ]

    @State var selectedPayments = Set<UUID>()
    
    var body: some View {
        NavigationView {
            VStack {
                List(self.paymentMethods, selection: self.$selectedPayments) { option in Text(option.name)}
                        }
                    }
            }
        }

