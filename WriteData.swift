//
//  FirebaseTest.swift
//  SwiftUIStarterKitApp
//
//  Created by Ben Kim on 10/13/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift
import FirebaseCore

class WriteData: ObservableObject{
    
    private let ref = Database.database().reference()
    
    
    func pushNewUser(username: String, name: String, pfp: String, bio: String, password: String, email: String, productList: [Int], serviceList: [Int]){
        self.ref.child("UserProfiles").child(username).child("username").setValue(username)
        self.ref.child("UserProfiles").child(username).child("name").setValue(name)
        self.ref.child("UserProfiles").child(username).child("profilePic").setValue(pfp)
        self.ref.child("UserProfiles").child(username).child("bio").setValue(bio)
        self.ref.child("UserProfiles").child(username).child("password").setValue(password)
        self.ref.child("UserProfiles").child(username).child("email").setValue(email)
        self.ref.child("UserProfiles").child(username).child("productList").setValue(productList)
        self.ref.child("UserProfiles").child(username).child("serviceList").setValue(serviceList)
        
    }
    
    func pushNewProduct(objectId: String, username: String, prodName: String, description: String, price: Float, image: String, category: [String]){
        self.ref.child("Products").child(objectId).child("objectId").setValue(objectId)
        self.ref.child("Products").child(objectId).child("username").setValue(username)
        self.ref.child("Products").child(objectId).child("productName").setValue(prodName)
        self.ref.child("Products").child(objectId).child("description").setValue(description)
        self.ref.child("Products").child(objectId).child("price").setValue(price)
        self.ref.child("Products").child(objectId).child("image").setValue(image)
        self.ref.child("Products").child(objectId).child("category").setValue(category)
    }
    
        
    
    func pushNewService(objectId: String, username: String, servName: String, description: String, price: Float, image: String, category: [String]){
        self.ref.child("Services").child(objectId).child("objectId").setValue(objectId)
        self.ref.child("Services").child(objectId).child("username").setValue(username)
        self.ref.child("Services").child(objectId).child("serviceName").setValue(servName)
        self.ref.child("Services").child(objectId).child("description").setValue(description)
        self.ref.child("Services").child(objectId).child("price").setValue(price)
        self.ref.child("Services").child(objectId).child("image").setValue(image)
        self.ref.child("Services").child(objectId).child("category").setValue(category)
    }
    
    func pushAppData(userCount: Int, prodCount: Int, servCount: Int){
        self.ref.child("AppData").child("userCount").setValue(userCount)
        self.ref.child("AppData").child("productCount").setValue(prodCount)
        self.ref.child("AppDaata").child("serviceCount").setValue(servCount)
    }
    
}
