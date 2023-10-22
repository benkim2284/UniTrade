import SwiftUI

struct ChatViewController: View {
    @State private var messageText = ""
    @State private var messages: [String] = []

    var body: some View {
        VStack {
            List(messages, id: \.self, rowContent: Text.init)
                .padding(.top)
            
            HStack {
                TextField("Type a message", text: $messageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button("Send") {
                    sendMessage()
                }
            }
            .padding()
        }
    }

    private func sendMessage() {
        if !messageText.isEmpty {
            messages.append(messageText)
            messageText = ""
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatViewController()
    }
}
