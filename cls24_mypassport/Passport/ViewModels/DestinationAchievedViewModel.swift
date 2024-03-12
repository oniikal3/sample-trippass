//
//  DestinationAchievedViewModel.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 7/3/24.
//

import Foundation

@Observable
class DestinationAchievedViewModel {
    
    var list: [DestinationAchieved] = [
        DestinationAchieved(provinceId: 1,
                            province: "Bangkok",
                            provinceIconImage: "",
                            parks: [
                                ParkAchieved(id: 1, name: "Arches National Park", description: "", imageURLs: ["https://picsum.photos/800/500"], latitude: 40.75773, longitude: -73.985708, achievedDate: .now),
                                ParkAchieved(id: 2, name: "Goreme National Park", description: "", imageURLs: ["https://picsum.photos/500/500"], latitude: 0.0, longitude: 0.0, achievedDate: .now),
                                ParkAchieved(id: 3, name: "Arches National Park", description: "", imageURLs: ["https://picsum.photos/800/500"], latitude: 0.0, longitude: 0.0, achievedDate: .now),
                                ParkAchieved(id: 4, name: "Goreme National Park", description: "", imageURLs: ["https://picsum.photos/500/500"], latitude: 0.0, longitude: 0.0, achievedDate: .now),
                                ParkAchieved(id: 5, name: "Arches National Park", description: "", imageURLs: ["https://picsum.photos/800/500"], latitude: 0.0, longitude: 0.0, achievedDate: .now),
                                ParkAchieved(id: 6, name: "Goreme National Park", description: "", imageURLs: ["https://picsum.photos/500/500"], latitude: 0.0, longitude: 0.0, achievedDate: .now),
        ])
    ]
    
    var numberOfParkAchieved: Int {
        // Calculate from data
        return 20
    }
    
    func sectionOfDestination(_ des: DestinationAchieved) -> String {
        let unit = des.parks.count > 1 ? "destinations" : "destination"
        return des.province + " " + "\(des.parks.count)" + " " + unit
    }
}
