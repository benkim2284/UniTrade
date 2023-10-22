//
//  ListingDetailView.swift
//  SwiftUIStarterKitApp
//
//  Created by Hera Chung on 10/14/2023
//

import SwiftUI
import Combine

struct ListingDetailView : View {

    @Binding var placeItem: ListingInformation?
    
    let defaultPoint = ListingInformation(id: "", listingName: "Default", listingDesc: "Default", seller: "Seller", price: 0.00, image: "Default PlaceHolder")
    
    @ObservedObject var selectedPoint = SelectedPoint()
    
    var body: some View {
        GeometryReader { g in
            ScrollView{
            VStack(alignment: .leading) {
                Text("@" + (self.placeItem?.seller ?? self.defaultPoint.seller)).padding(.leading, 30).padding(.trailing, 30).padding(.top, 30)
                
                HStack{
                    Text(self.placeItem?.listingName ?? self.defaultPoint.listingName)
                        .font(.system(size: 33, weight: .bold, design: .default))
                    Spacer()
                    Text("$ \((self.placeItem?.price ?? self.defaultPoint.price), specifier: "%.2f")").font(.system(size: 30, weight: .bold, design: .default))
                }.padding(.leading, 30).padding(.trailing, 30).padding(.top, 1)
                
                Image(self.placeItem?.image ?? "")
                        .renderingMode(.original)
                        .resizable()
                        .frame(width: g.size.width - 30, height: 400)
                        .background(Color.white)
                        .aspectRatio(contentMode: .fill)
                        .padding(.bottom, 5)
                        .padding(.leading, 15)
                        .padding(.trailing, 15)

                    Text(self.placeItem?.listingDesc ?? self.defaultPoint.listingName).padding(.leading, 30).padding(.trailing, 30)
                }
            }
        .edgesIgnoringSafeArea(.bottom)
        }
    }
}
