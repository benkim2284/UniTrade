//
//  ActivitiesMockStore.swift
//  SwiftUIStarterKitApp
//
//  Created by Osama Naeem on 06/08/2019.
//  Copyright © 2019 NexThings. All rights reserved.
//

import SwiftUI

class ListingMarket {
    
    
    static let listings: [ListingType] = [
        ListingType(id: 0, activityName: "ALL", activityNameLabel: "All", activityImage: "Chamonix", selectedActivity: false),
        ListingType(id: 1, activityName: "PRODUCT", activityNameLabel: "Product", activityImage: "boots", selectedActivity: false),
        ListingType(id: 2, activityName: "SERVICE", activityNameLabel: "Service", activityImage: "cameras", selectedActivity: false)
    ]
    
//    static let activityData: [ListingData] = [
//        
//        ListingData(id: 0, activitiesPlaces:
//                        [ListingInformation(id: 0, listingName: "Used Bike", listingDesc: "sample description", seller: "abc123", price: 150, image: "snowbird"),
//                         ListingInformation(id: 1, listingName: "Product 2", listingDesc: "sample description", seller: "abc123", price: 150, image: "snowbird"),
//                         ListingInformation(id: 2, listingName: "Product 3", listingDesc: "sample description", seller: "abc123", price: 150, image: "snowbird")
//            ]),
//        ListingData(id: 1, activitiesPlaces:
//                        [ListingInformation(id: 0, listingName: "Used Bike", listingDesc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", seller: "abc123", price: 150, image: "snowbird"),
//                         ListingInformation(id: 1, listingName: "Product 2", listingDesc: "sample description", seller: "abc123", price: 150, image: "snowbird"),
//                         ListingInformation(id: 2, listingName: "Product 3", listingDesc: "sample description", seller: "abc123", price: 150, image: "snowbird")
//            ]),
//        
//        ListingData(id: 2, activitiesPlaces:
//                        [ListingInformation(id: 0, listingName: "Photographer", listingDesc: "price rates are variable", seller: "abc123", price: 20, image: "cameras"),
//                         ListingInformation(id: 1, listingName: "Service 2", listingDesc: "sample description", seller: "abc123", price: 150, image: "cameras"),
//                         ListingInformation(id: 2, listingName: "Service 3", listingDesc: "sample description", seller: "abc123", price: 150, image: "cameras")
//            ])
//    ]
}
