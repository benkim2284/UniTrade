//
//  EditProfile.swift
//  SwiftUIStarterKitApp
//
//  Created by Matthew Lu on 10/14/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI

struct EditProfileView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var pronouns = ""
    @State private var bio = ""
    @State private var number = ""

    var body: some View {
        let accountView = AccountView(globalIdentity: "")
        NavigationView {
            Form {
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Pronouns", text: $pronouns)
                    TextField("Phone Number", text: $number)
                    TextField("Email", text: $email)
                }

                Section(header: Text("Bio")) {
                    TextEditor(text: $bio)
                        .frame(height: 100)
                }

                Button("Save Changes") {
                    //AND UPDATE PROFILE HERE IN DATABASE
                    accountView.editProfile = false
                }
                .frame(width: 140, height:20)
                .background(Color.blue)
                .foregroundColor(.white)
            }
            
            .navigationBarTitle("Edit Profile")
        }
//        .navigationViewStyle(StackNavigationViewStyle()) // Use this if you're on iOS 14 or earlier
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
