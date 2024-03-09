//
//  DestinationRowView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 6/3/24.
//

import SwiftUI

struct DestinationRowView: View {
    
    let park: ParkAchieved
    
    private let viewHeight: CGFloat = 280
    private let cornerRadius: CGFloat = 20
    
    var backgroundView: some View {
        GeometryReader(content: { geometry in
            AsyncImage(url: URL(string: park.imageURLs.first ?? "")) { image in
                image
                    .resizable()
                    .scaledToFill()
            } placeholder: {
                ZStack {
                    Color.main
                    ProgressView()
                }
            }
            .frame(width: geometry.size.width, height: viewHeight)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
        })
        
    }
    
    //    var body: some View {
    //        VStack {
    //            Spacer()
    //            HStack (alignment: .bottom) {
    //                VStack (alignment: .leading) {
    //                    Text(park.name)
    //                        .foregroundStyle(.white)
    //                        .font(.system(size: 32, weight: .bold))
    //                        .multilineTextAlignment(.leading)
    //
    //                    Text(park.achievedDate.formatted())
    //                        .foregroundStyle(.white)
    //                }
    //
    //                Spacer()
    //
    //                Image(systemName: "arrow.forward")
    //                    .resizable()
    //                    .scaledToFit()
    //                    .frame(width: 30, height: 30)
    //                    .foregroundStyle(.white)
    //                    .padding(.horizontal, 30)
    //                    .padding(.vertical, 16)
    //                    .background(
    //                        RoundedRectangle(cornerRadius: 20.0)
    //                            .fill(.gray.opacity(0.5))
    //                    )
    //
    //            }
    //            .padding(.horizontal)
    //            .background(.green)
    //        }
    //        .background(
    //            backgroundView
    //        )
    //        //            .frame(height: 250)
    //    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            backgroundView
            
            HStack (alignment: .bottom) {
                VStack (alignment: .leading) {
                    Text(park.name)
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .bold))
                        .multilineTextAlignment(.leading)
                    
                    Text(park.achievedDate.formatted())
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Image(systemName: "arrow.forward")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 30)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: cornerRadius)
                            .fill(.main.opacity(0.5))
                    )
            }
            .padding()
            .background(
//                .black.opacity(0.1)
                LinearGradient(colors: [.black.opacity(0.5), .white.opacity(0)], startPoint: .bottom, endPoint: .top)
            )
            .clipShape( // clip shape for gradient view
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: cornerRadius,
                    bottomTrailingRadius: cornerRadius,
                    topTrailingRadius: 0
                )
            )
        }
//        .padding(.horizontal)
        .frame(height: viewHeight)
    }
}

#Preview(traits: .sizeThatFitsLayout) {
    let data = ParkAchieved(id: 1, name: "Zion National Park", description: "zzzz", imageURLs: ["https://picsum.photos/400/250", "https://picsum.photos/400/250"], latitude: 0.0, longitude: 0.0, achievedDate: .now)
    return DestinationRowView(park: data)
}
