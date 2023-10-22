//
//  SignUpView.swift
//  SwiftUIStarterKitApp
//
//  Created by Osama Naeem on 03/08/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import SwiftUI
import PhotosUI
import Firebase
import FirebaseStorage

struct SignUpView: View {
    
    @State var emailAddress: String = ""
    @State var name: String = ""
    @State var phone: String = ""
    @State var password: String = ""
    @State var bio: String = ""
    @State var pronouns: String = ""
    @State var filledVar: String = ""
    @State var username: String = ""
    @State var confirmPassword: String = ""
    @State private var showTermsAndPrivacy = false
    @State private var createComplete = false
    @State var validAcc = false
    @State private var navigateToHome = false
    
    var bobModel = WriteData()
    @ObservedObject  var viewModel = ContentViewModel()
    
    
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                ScrollView {
                    VStack (alignment: .center){
                        HStack (alignment: .center){
                            Spacer()
                        }
                        
                        Text("Create an Account")
                            .font(.title)
                            .font(.system(size: 14, weight: .bold, design: Font.Design.default))
                            .padding(.bottom, 10)
                        
                        
                        VStack {
                            // Define a list for photos and descriptions.
                            ImageList(viewModel: viewModel)
                            
                            // Define the app's Photos picker.
                            PhotosPicker(
                                selection: $viewModel.selection,
                                matching: .images,
                                preferredItemEncoding: .current,
                                photoLibrary: .shared()
                            ) {
                                Text("+")
                                    .font(.system(size: 18))
                                Text("Add Photo (Required)")
                                    .font(.system(size: 10))
                            }
                            .frame(width: 100, height: 100)
                            .foregroundColor(Color.white)
                            .background(Color.blue)
                            .onAppear {
                                viewModel.attachments = viewModel.selection.map { item in
                                    // Access an existing attachment, if it exists; otherwise, create a new attachment.
                                    return viewModel.attachmentByIdentifier[item.identifier] ?? ContentViewModel.ImageAttachment(item)
                                }
                            }
                        }
                        .clipShape(Circle())
                        .padding(.bottom, 10)
                        .frame(height: 200)
                      
                        
                        VStack {
                            TextField("Name (Required)", text: self.$name)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            TextField("Username (Required)", text: self.$username)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            TextField("Pronouns", text: self.$pronouns)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            TextField("Email (Required)", text: self.$emailAddress)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            TextField("Phone", text: self.$phone)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            SecureField("Password (Required)", text: self.$password)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            SecureField("Confirm Password (Required)", text: self.$confirmPassword)
                                .frame(width: geometry.size.width - 45, height: 40)
                                .textContentType(.emailAddress)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.red)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                            
                            
                            
                            VStack(alignment: .leading) {
                                Text("bio: (Required)")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10) // You can use any shape here
                                        .frame(width: 350, height: 100)
                                        .foregroundColor(Color.gray.opacity(0.3))
                                    
                                    TextEditor(text: $bio)
                                        .frame(width: 340, height: 90)
                                        .padding(5)
                                }
                                
                            }
                            
                            Button("Show Terms and Privacy") {
                                // Set the state variable to true to trigger the navigation link
                                showTermsAndPrivacy = true
                            }
                            .padding()
                            .sheet(isPresented: $showTermsAndPrivacy) {
                                TermsAndPrivacyView()
                            }
                        }
                        Text(filledVar)
                            .foregroundColor(.red)
                            .font(.system(size: 12))
                        
                        
                        @StateObject
                        var viewModel2 = WriteData()
                        
                        @StateObject
                        var checkExists = FirebaseTest()
                        
                        Button(action: {
                            guard let selectedData = viewModel.attachments.first?.selectedData else {
                                print("No image selected")
                                return
                            }
                            
                            guard let imageData = UIImage(data: selectedData), let jpegData = imageData.jpegData(compressionQuality: 0.8) else {
                                print("Failed to convert image to data")
                                return
                            }
                            let storage = Storage.storage()
                            let path = "images/\(UUID().uuidString).jpg"
                            let storageRef = storage.reference().child(path)
                            
                            let uploadTask = storageRef.putData(jpegData, metadata: nil) { metadata, error in
                                if let error = error {
                                    print("Error uploading image to Firebase Storage: \(error.localizedDescription)")
                                } else {
                                    storageRef.downloadURL { url, error in
                                        if let downloadURL = url {
                                            
                                            
                                            
                                            let imageURL = path
                                            let imageDescription = "A description for the uploaded image"
                                            
                                            viewModel2.pushNewUser(username: username, name: name, pfp: imageURL, bio: bio, password: password, email: emailAddress, productList: [], serviceList: [])
                                            
                                            
                                            
                                        } else if let error = error {
                                            print("Error getting download URL: \(error.localizedDescription)")
                                        }
                                    }
                                    
                                }
                            }
                            
                            let filled = !name.isEmpty && !emailAddress.isEmpty && emailAddress.contains("@gatech.edu") && !password.isEmpty && !bio.isEmpty && !username.isEmpty && !confirmPassword.isEmpty && confirmPassword == password
                            
                            if filled {
                                checkExists.keyExistsInFirebase(key: username) {
                                    exists in
                                    if exists {
                                        filledVar = "Account Already Exists"
                                    } else {
                                        validAcc = true
                                        filledVar = ""
                                        viewModel2.pushNewUser(username: username, name: name, pfp: "fakepfp", bio: bio, password: password, email: emailAddress, productList: [1,4], serviceList: [2,3])
                                    }
                                }
                                
                            }
                            if !filled {
                                filledVar = "Not all required fields are filled!"
                            }
                        }) {
                            Text("Create Account")
                                .padding()
                                .frame(width: geometry.size.width - 40, height: 40)
                                .foregroundColor(Color.white)
                                .background(Color.blue)
                                .cornerRadius(5)
                                .alert(isPresented: $validAcc) {
                                    Alert(title: Text("Proceed?"), message: Text("Confirm Account"), primaryButton: .default(Text("Accept"), action: {
                                        navigateToHome = true
                                    }), secondaryButton: .default(Text("Decline")))
                                }
                            NavigationLink(destination: LogInView(), isActive: $navigateToHome) {
                                EmptyView()
                            }
                        }.padding(.bottom, 10)
                        
                    }
                }
                
            }
        }
    }
    
    
    
    // A view that lists selected photos and their descriptions.
        struct ImageList: View {
            
            /// A view model for the list.
            @ObservedObject var viewModel: ContentViewModel
            
            /// A container view for the list.
            var body: some View {
                if !viewModel.attachments.isEmpty {
                    // Create a row for each selected photo in the picker.
                    List(viewModel.attachments) { imageAttachment in
                        ImageAttachmentView(imageAttachment: imageAttachment)
                    }.listStyle(.plain)
                }
            }
        }

    /// A row item that displays a photo and a description.
    struct ImageAttachmentView: View {
        
        /// An image that a person selects in the Photos picker.
        @ObservedObject var imageAttachment: ContentViewModel.ImageAttachment
        
        /// A container view for the row.
        var body: some View {
            HStack {
                
                // Define text that describes a selected photo.
                TextField("Image Description", text: $imageAttachment.imageDescription)
        
                
                // Add space after the description.
                Spacer()
                
                // Display the image that the text describes.
                switch imageAttachment.imageStatus {
                case .finished(let image):
                    image.resizable().aspectRatio(contentMode: .fit).frame(height: 100)
                case .failed:
                    Image(systemName: "exclamationmark.triangle.fill")
                default:
                    ProgressView()
                }
            }.task {
                // Asynchronously display the photo.
                await imageAttachment.loadImage()
            }
        }
    }

}

struct Previews_SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
