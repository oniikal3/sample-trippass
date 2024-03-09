//
//  CarouselItemView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 2/3/24.
//

import SwiftUI

struct CarouselItemView: View {
    
    var data: CarouselData
    
    var body: some View {
        VStack {
            Spacer()
            
            Text(data.title)
                .font(.largeTitle)
                .foregroundStyle(.white)
            
            Text(data.description)
                .font(.subheadline)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
                .lineLimit(3)
            
            Spacer()
                .frame(height: 32)
        }
        .padding()
        .background(
            AsyncImage(url: URL(string: data.imageURL)) { image in
                image
                    .resizable()
                    .scaledToFill()
//                    .frame(width: .infinity)
            } placeholder: {
                ZStack {
                    Color.main
                    ProgressView()
                }
            }
        )
    }
}

#Preview {
    let data = CarouselData(imageURL: "https://picsum.photos/200/200", title: "Mount Fuji", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,")
    return CarouselItemView(data: data)
}
