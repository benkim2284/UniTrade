//
//  CreateListing.swift
//  SwiftUIStarterKitApp
//
//  Created by Hera Chung on 10/13/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI
import PhotosUI
import FirebaseStorage
import Firebase
import FirebaseDatabase
import UIKit

struct CreateListing: View {
    @State var title: String = ""
    @State var description: String = ""
    @State var listing: Int = 0
    @State var listingTypes: [String] = ["Product", "Service"]
    @State private var selectedImage: UIImage? // Replace with your image source
    
    var firebaseModel = WriteData()

    @State var price: Double = 0.0
    
    //@State var paymentMethods: [String] = ["Venmo", "Zelle", "PayPal", "ApplePay", "Cash"]
    @State var selectedPayments = Set<UUID>()

    @StateObject private var viewModel = ContentViewModel()
    
    private let numberFormatter: NumberFormatter
    init() {
        numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
    }
    
    var body: some View {
        GeometryReader { g in
            VStack {
                Text("Create a new listing...")
                    .font(.system(size: 20))
                Form {
                    Section(header: Text("Required Information")){
                        HStack{
                            //                            Text("Title:")
                            //                                .font(.system(size: 18))
                            TextField("Add a title here...", text: self.$title)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.black)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                        }
                        
                        TextField("Add a description here...", text: self.$description)
                            .frame(height: 100)
                            .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                            .accentColor(.black)
                            .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                            .cornerRadius(5)
                        
                        HStack{
                            Text("Price:")
                                .font(.system(size: 18))
                            TextField("$0.00", value: self.$price, formatter: numberFormatter)
                                .padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
                                .accentColor(.black)
                                .background(Color(red: 242 / 255, green: 242 / 255, blue: 242 / 255))
                                .cornerRadius(5)
                        }
                        Picker(selection: self.$listing, label: Text("Listing Type")) {
                            ForEach(0 ..< self.listingTypes.count) {
                                Text(self.listingTypes[$0]).tag($0)
                            }
                        }
                    }
                    Section(header: Text("Photos")) {
                        VStack {
                            // Define a list for photos and descriptions.
                            ImageList(viewModel: viewModel)
                        }
                        .frame(height: 250)
                            // Define the app's Photos picker.
                            PhotosPicker(
                                selection: $viewModel.selection,
                                selectionBehavior: .continuousAndOrdered,
                                matching: .images,
                                preferredItemEncoding: .current,
                                photoLibrary: .shared()
                            ) {
                                Text("Insert Photos")
                            }
                            .frame(height: 10)
                            .onAppear {
                                viewModel.attachments = viewModel.selection.map { item in
                                    // Access an existing attachment, if it exists; otherwise, create a new attachment.
                                    return viewModel.attachmentByIdentifier[item.identifier] ?? ContentViewModel.ImageAttachment(item)
                                }
                        
                    }
                        Button("Submit") {
                
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
                                            let randomNumber = Int.random(in: 0...5000)
                                            
                                            if listingTypes[listing] == "Product" {
                                                firebaseModel.pushNewProduct(objectId: String(randomNumber),  username: "username", prodName: title, description: description, price: Float(price),  image: imageURL,  category: ["t"])
                                            } else{
                                                firebaseModel.pushNewService(objectId: String(randomNumber),  username: "username", servName: title, description: description, price: Float(price),  image: imageURL,  category: ["t"])
                                            }
//
                                        } else if let error = error {
                                            print("Error getting download URL: \(error.localizedDescription)")
                                        }
                                    }
                                    
                                }
                            }
                            
                        }
//                        .task {
//                            await viewModel.att.loadImage()
//                        }
//
                        
                        
                        
                        
                    }
                    
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


#Preview {
    CreateListing()
}
