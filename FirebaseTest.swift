//
//  FirebaseTest.swift
//  SwiftUIStarterKitApp
//
//  Created by Matthew Lu on 10/13/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import FirebaseDatabase
import FirebaseDatabaseSwift

class FirebaseTest: ObservableObject{
    
    private let ref = Database.database().reference()
    
    func readValue(value: String){
        //self.ref.child("user").setValue(value)
        self.ref.child("user").child(value).child("name").setValue("Kim")
        
        
    }
    
}
