//
//  WriteView.swift
//  SwiftUIStarterKitApp
//
//  Created by Ben Kim on 10/13/23.
//  Copyright © 2023 NexThings. All rights reserved.
//

import Foundation
import SwiftUI


struct WriteView: View{
    
    var globalIdentity: String
    
    @StateObject
    var viewModel = FirebaseTest()
    
    @State
    var content: String = ""
    
    
    
    
    var body: some View{
        VStack{
            TextEditor(text: $content)
                .frame(width: .infinity, height: 50)
                .padding()
            Button {
                //viewModel.getUserData(username: "BOBBYKIM")
            } label: {
                Text("Get Data")
                    .padding()
            }

        }.frame(width: .infinity, alignment: .top)
    }
}

struct Write_Preview: PreviewProvider{
    static var previews: some View{
        WriteView(globalIdentity: "globalIdentity")
    }
    
}
