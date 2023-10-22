//
//  TermsAndPrivacyView.swift
//  SwiftUIStarterKitApp
//
//  Created by Matthew Lu on 10/14/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI

struct TermsAndPrivacyView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Terms of Service")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    Text("This is the content of your Terms of Service.")
                        .padding()
                }
                
                Text("Privacy Policy")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    Text("This is the content of your Privacy Policy.")
                        .padding()
                }
            }
            .navigationBarTitle("Terms and Privacy")
        }
    }
}

struct TermsAndPrivacyView_Previews: PreviewProvider {
    static var previews: some View {
        TermsAndPrivacyView()
    }
}
