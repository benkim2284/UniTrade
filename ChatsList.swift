//
//  ChatList.swift
//  SwiftUIStarterKitApp
//
//  Created by Matthew Lu on 10/14/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI

struct ChatsList: View {
    let chats = ["George P. Burdell", "Buzz", "Brent Key", "Lebron James", "Taylor Swift"]

    var body: some View {
        NavigationView {
                    List(chats, id: \.self) { chat in
                        NavigationLink(destination: ChatViewController()) {
                            ChatItem(name: chat)
                        }
                    }
            }
        .navigationBarItems(trailing: Button("Log Out", action: {
            AccountView.loggedOut = true
        }))
        .navigationBarTitle("Conversations")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ChatsList_Previews: PreviewProvider {
    static var previews: some View {
        ChatsList()
    }
}

struct ChatItem: View {
    let name: String

    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.headline)
            Text("Matt lu is so cool") // You can replace this with the actual last message
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .padding(8)
    }
}
