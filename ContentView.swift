//
//  ContentView.swift
//  SwiftUIStarterKitApp
//
//  Created by Osama Naeem on 01/08/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import SwiftUI
import Combine

class UserSettings: ObservableObject {
    @Published var loggedIn : Bool = false;
    @Published var navigateNowToLogIn: Bool = false;
    @Published var navigateNowToSignup: Bool = false
}

let items = Array(1...12) // Example data

struct StartView: View {
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        if settings.loggedIn {
            return AnyView(TabbarView(globalIdentity: ""))
        }else {
            return AnyView(ContentView())
        }
    }
}

struct OnboardingModel {
    var id: Int
    var image: String
    var titleText: String
    var descriptionText: String
    var showButton: Bool?
}

struct ContentView: View {
//    @EnvironmentObject var settings: UserSettings

    var body: some View {
        NavigationView {
        VStack {
            
            ScrollView {
                
                Text("UniTrade")
                    .padding(.top, 25)
                    .font(.title)
                    .font(.system(size: 16, weight: .bold, design: Font.Design.default))
                    .padding(.bottom, 3)
                LazyVGrid(columns: [GridItem(.flexible(), spacing: 1), GridItem(.flexible(), spacing: 1)], spacing: 15) {
                    ForEach(items, id: \.self) { _ in
                        VStack {
                            Image("jover") // Use "jover" for all the images
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 180, height: 180)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                            Text("JOVER")
                        }
                
                    }
                }                .padding(10)
                .padding(.bottom, 10)
            }
                VStack {
                               Spacer()
                               Spacer() // Create space at the top
                               HStack {
                                   Spacer() // Create space on the left
                                   NavigationLink(destination: Text("Home")) {
                                       Image(systemName: "house.fill")
                                           .font(.system(size: 40))
                                           .padding(.top, 8)
                                           .padding(.leading, 5)
                                           .padding(.trailing, 5)
                                   }
                                   NavigationLink(destination: Text("Search")) {
                                       Image(systemName: "magnifyingglass")
                                           .font(.system(size: 40))
                                           .padding(.top, 8)
                                           .padding(.leading, 5)
                                           .padding(.trailing, 5)
                                   }
                                   NavigationLink(destination: Text("Post")) {
                                       Image(systemName: "plus.circle")
                                           .font(.system(size: 40))
                                           .padding(.top, 8)
                                           .padding(.leading, 5)
                                           .padding(.trailing, 5)
                                   }
                                   NavigationLink(destination: Text("Messages")) {
                                       Image(systemName: "message.fill")
                                           .font(.system(size: 40))
                                           .padding(.top, 8)
                                           .padding(.leading, 5)
                                           .padding(.trailing, 5)
                                   }
                                   NavigationLink(destination: AccountView(globalIdentity: "")) {
                                       Image(systemName: "person.fill")
                                           .font(.system(size: 40))
                                           .padding(.top, 8)
                                           .padding(.leading, 5)
                                           .padding(.trailing, 5)
                                   }
                                   Spacer() // Create space on the right
                               }
                               .navigationBarTitle("", displayMode: .inline)
                               .padding(.bottom, 0)
                       
                }
                    
                
            }
                .navigationBarBackButtonHidden(true)
            .frame(width: 350, height: 37)
        }
        
      
//
//    GeometryReader { geometry in
//        NavigationView {
//                ZStack {
//                    NavigationLink(destination: LogInView(), isActive: self.$settings.navigateNowToLogIn) { EmptyView() }
//                    NavigationLink(destination: SignUpView(), isActive: self.$settings.navigateNowToSignup) { EmptyView() }
//
//                    SwiftyUIScrollView(axis: .horizontal, numberOfPages: self.onboardingDataArray.count, pagingEnabled: true, pageControlEnabled: true, hideScrollIndicators: true, currentPageIndicator: .black, pageIndicatorTintColor: .gray) {
//                                HStack(spacing: 0) {
//                                    ForEach(self.onboardingDataArray, id: \.id) { item in
//                                          OnboardingView(onboardingData: item)
//                                                .frame(width: geometry.size.width, height: geometry.size.height)
//                                       }
//                                }
//                            }.frame(width: geometry.size.width, height: geometry.size.height)
//                }
//            }
        
    }
}

struct OnboardingView: View {
    var onboardingData: OnboardingModel
    @EnvironmentObject var settings: UserSettings
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 10) {
                Spacer()
                Image("\(self.onboardingData.image)")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .aspectRatio(contentMode: ContentMode.fill)
                    .clipShape(Circle())
                    .padding(20)
                
                Text("\(self.onboardingData.titleText)")
                    .frame(width: geometry.size.width, height: 20, alignment: .center)
                    .font(.title)
                
                Text("\(self.onboardingData.descriptionText)")
                    .lineLimit(nil)
                    .padding(.leading, 15)
                    .padding(.trailing, 15)
                    .font(.system(size: 16))
                    .frame(width: geometry.size.width, height: 50, alignment: .center)
                    .multilineTextAlignment(.center)
                
//                Spacer(minLength: 20)
                Spacer()
                if self.onboardingData.showButton ?? false {
                    VStack {
                        Button(action: {
                           self.settings.navigateNowToLogIn = true
                        }) {
                               HStack {
                                   Text("Log In")
                               }.frame(width: geometry.size.width - 200, height: 40)
                               .foregroundColor(Color(.white))
                               .background(Color(UIColor.gray))
                               .cornerRadius(10)
                               .padding(.bottom, 5)
                           }
                        
                        Button(action: {
                                self.settings.navigateNowToSignup = true
                                }) {
                                HStack {
                                       Text("Sign Up")
                                }.frame(width: geometry.size.width - 200, height: 40)
                                  .foregroundColor(Color(.white))
                                  .background(Color(UIColor.gray))
                                  .cornerRadius(10)
                           }
                        
                    }.padding(.bottom, 30)
                }
                
                Spacer()
            }
        }
    }
}


//#if DEBUG
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        StartView()
//    }
//}
//#endif
//
struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
