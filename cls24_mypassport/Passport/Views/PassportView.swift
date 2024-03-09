//
//  PassportView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 2/3/24.
//

import SwiftUI

struct ParkAchieved: Identifiable, Hashable {
    let id: Int
    let name: String
    let description: String
    let imageURLs: [String]
    let latitude: Float
    let longitude: Float
    let achievedDate: Date
}

struct DestinationAchieved {
    let provinceId: Int
    let province: String
    let provinceIconImage: String
    let parks: [ParkAchieved]
}

struct PassportView: View {
    
    @State private var viewModel = DestinationAchievedViewModel()
    
    var body: some View {
        NavigationStack {
//            VStack(alignment: .leading, spacing: 0) {
//                Text("Passing through \(viewModel.numberOfParkAchieved) destinations")
//                    .font(.system(size: 16, weight: .medium))
//                    .padding()
                
                List {
                    ForEach(viewModel.list, id: \.provinceId) { destination in
                        Section {
                            ForEach(destination.parks) { park in
                                ZStack {
                                    DestinationRowView(park: park)
                                        .listRowInsets(.init(top: 8, leading: 16, bottom: 8, trailing: 16))
                                    NavigationLink(value: park) {
                                        // Do this way because of Apple are not support to remove arrow at the right yet.
                                    }
                                    .opacity(0)
                                    .buttonStyle(PlainButtonStyle())
                                }
                            }
                            .listRowSeparator(.hidden)

                        } header: {
                            HStack {
                                Image(destination.provinceIconImage)
                                Text(viewModel.sectionOfDestination(destination))
                            }
                        }
                        .listSectionSeparator(.hidden)
                    }
                }
                .listStyle(.plain)
                .safeAreaPadding(.bottom, 50)
//                .padding(.bottom, 20)
//                .safeAreaInset(edge: .bottom, spacing: 50, content: {
//                    Text("Shit")
//                })
//            }
            .navigationTitle("Achieved")
            .navigationDestination(for: ParkAchieved.self) { selectedPark in
                DestinationDetailView(viewModel: viewModel, park: selectedPark)
                    
            }
        }
    }
}

#Preview {
    PassportView()
} 
