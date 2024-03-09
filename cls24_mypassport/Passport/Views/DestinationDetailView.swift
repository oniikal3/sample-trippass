//
//  DestinationDetailView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 7/3/24.
//

import SwiftUI
import MapKit

//class DestinationDetailViewModel {
//    private var park: ParkAchieved
//
//    init(park: ParkAchieved) {
//        self.park = park
//    }
//}

struct DestinationDetailView: View {
    
    var viewModel: DestinationAchievedViewModel
    // declare viewmodel and send view model in to the view instead of data model.
    var park: ParkAchieved
    
    //    private var viewModel: DestinationDetailViewModel
    
    //    init(park: ParkAchieved) {
    //        self.park = park
    //        self.viewModel = DestinationDetailViewModel(park: park)
    //    }
    
    @Environment(\.colorScheme) var colorScheme
    
    @State private var selectedImage: Int = 0
    
    private let segments = ["Description", "Location"]
    @State private var selectedTabInfo: String = "Description"
    
    //    init(viewModel: DestinationAchievedViewModel, park: ParkAchieved) {
    //        self.viewModel = viewModel
    //        self.park = park
    //
    //        // Use first image when view loaded
    //        self.selectedImage = park.imageURLs.count > 0 ? park.imageURLs[0] : ""
    //    }
    
    //https://www.avanderlee.com/swiftui/viewbuilder/
    @ViewBuilder
    var backgroundImageView: some View {
        if selectedImage <= park.imageURLs.count - 1 {
            VStack(spacing: 0) {
                AsyncImage(url: URL(string: park.imageURLs[selectedImage])) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .containerRelativeFrame(.vertical) { size, axis in
                            size * 0.75
                        }
                } placeholder: {
                    Color.gray
                }
                .ignoresSafeArea(.all)
                
                Spacer()
            }
        } else {
            EmptyView()
        }
    }
    
    var headerAndImagesView: some View {
        HStack(alignment: .bottom) {
            VStack {
                Text(park.name)
                //                    .foregroundStyle(.black)
                    .font(.system(size: 40, weight: .bold))
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
            }
            Spacer()
            VStack(spacing: 0) {
                ForEach(Array(park.imageURLs.enumerated()), id: \.element) { index, urlString in
                    AsyncImage(url: URL(string: urlString)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        Color.gray
                    }
                    .frame(width: 60, height: 60)
//                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .if({
//                        selectedImage == park.imageURLs.firstIndex(of: urlString)
                        selectedImage == index
                    }()) { view in
                        view
                            .overlay {
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(.main, lineWidth: 3)
                            }
                    }
                    .padding(.vertical, 8)
                    .onTapGesture {
                        selectedImage = index
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    var informationView: some View {
        SegmentedView(segments: segments, selected: $selectedTabInfo)
        //        let index = segments.firstIndex(of: selectedTabInfo)
        switch selectedTabInfo {
        case "Description":
            Text(park.description)
                .font(.system(size: 16))
        case "Location":
            mapView
        default:
            EmptyView()
        }
    }
    
    //    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    //ref: https://www.appcoda.com/swiftui-maps/
    @State private var position: MapCameraPosition = .automatic
    @ViewBuilder
    var mapView: some View {
        let center = CLLocationCoordinate2D(latitude: CLLocationDegrees(park.latitude), longitude: CLLocationDegrees(park.longitude))
        let span = MKCoordinateSpan(latitudeDelta: 0.08, longitudeDelta: 0.08)
        let region = MKCoordinateRegion(center: center, span: span)
        //        Map(initialPosition: .region(region))
        //        Map(initialPosition: .item(MKMapItem(placemark: .init(coordinate: center))))
        Map(position: $position) {
            //            Marker(coordinate: center) {
            //                Text(park.name)
            //                Image(systemName: "heart.circle")
            //            }
            Annotation(park.name, coordinate: center, anchor: .bottom) {
                Image(systemName: "heart.circle")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .symbolEffect(.variableColor)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.main.opacity(0.7))
                    .clipShape(Circle())
            }
        }
        .onAppear {
            position = .region(region)//.item(MKMapItem(placemark: .init(coordinate: center)))
        }
        .frame(height: 350)
    }
    
    var contentScrollView: some View {
        //        GeometryReader(content: { geometry in
        ScrollView(.vertical) {
            
            Spacer(minLength: 200)
            
            VStack(alignment: .leading, spacing: 16) {
                headerAndImagesView
                informationView
            }
        }
        .scrollIndicators(.hidden)
        .padding() // Can it change to inset?
        .background(
            VStack(spacing: 0) {
                let whiteColors: [Color] = [.white, .white, .white.opacity(0)]
                let blackColor: [Color] = [.black, .black, .black.opacity(0)]
                LinearGradient(colors: colorScheme == .dark ? blackColor : whiteColors, startPoint: .bottom, endPoint: .top)
                    .ignoresSafeArea(edges: .bottom)
            }
        )
    }
    
    var body: some View {
        VStack(spacing: 0) {
            contentScrollView
        }
        .background(
            backgroundImageView
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar(.hidden, for: .tabBar)
//        .toolbar(.hidden, for: .navigationBar)
        .toolbarBackground(.hidden, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                BackButton()
            }
        }
        .onAppear(
            perform: {
                //                selectedImage = park.imageURLs.count > 0 ? park.imageURLs[0] : ""
                //                selectedImage = "https://google.com"
            })
    }
}

#Preview {
    let data = ParkAchieved(id: 1, name: "Arches National Park", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris ultricies justo felis, blandit accumsan diam lacinia eu. Fusce posuere in justo vitae cursus. Donec ut sem sollicitudin, consequat est vel, varius ante. Integer cursus vehicula euismod. Suspendisse sit amet malesuada dolor. In sit amet sapien posuere, mollis turpis sed, sagittis felis. Curabitur dapibus commodo ante vel convallis. Nulla et lorem varius, pulvinar tortor eu, imperdiet massa. Mauris auctor nunc neque, ac rutrum mi posuere at.", imageURLs: ["https://firebasestorage.googleapis.com/v0/b/trippass-7dd2b.appspot.com/o/doi_pha_hom_pok_02.jpeg?alt=media&token=140bd062-a74e-4325-9527-67bdda354133", "https://firebasestorage.googleapis.com/v0/b/trippass-7dd2b.appspot.com/o/doi_pha_hom_pok_03.jpeg?alt=media&token=06fa6fee-3766-44e4-bb8a-4ecd0731b906"], latitude: 40.75773, longitude: -73.985708, achievedDate: .now)
    let vm = DestinationAchievedViewModel()
    return NavigationStack {
        DestinationDetailView(viewModel: vm, park: data)
//            .navigationTitle("sss")
    }
}
