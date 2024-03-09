//
//  RecommendView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 2/3/24.
//

import SwiftUI

struct RecommendView: View {
    
    @State private var currentScrollIndex: Int? = 0
    
    private let list = [
        CarouselData(imageURL: "https://picsum.photos/1000/1000",
                     title: "Mount Fuji",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,"),
        CarouselData(imageURL: "https://picsum.photos/1000/1000",
                     title: "Mount Fuji2",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,"),
        CarouselData(imageURL: "https://picsum.photos/1000/1000",
                     title: "Mount Fuji3",
                     description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,")
    ]
    
    var body: some View {
        GeometryReader(content: { geometry in
            VStack (spacing: 16) {
                VStack(spacing: 0, content: {
                    Image(systemName: "map.circle")
                        .resizable()
                        .frame(width: 30, height: 30)
                    Text(currentScrollIndex == 0 ? "Kanchanaburi" : String(currentScrollIndex ?? 999)) // ให้มาใช้ RecommendData แล้วเอาา currentIndex มาถึงไปแสดงแทน
                        .font(.system(.largeTitle, weight: .bold))
                })
                
                ZStack(alignment: .bottom) {
                    CarouselView(list: list, height: geometry.size.height * 0.7, currentScrollIndex: $currentScrollIndex)
                    
                    Button(action: {
                        
                    }, label: {
                        Text("Explore")
                            .font(.headline)
                            .foregroundStyle(.black)
                            .padding(.horizontal, 32)
                            .padding(.vertical, 16)
                            .background(
                                RoundedRectangle(cornerRadius: 20.0)
                                    .fill(.white)
                                    .stroke(.grayE5, lineWidth: 2)
                            )
                    })
                    .offset(CGSize(width: 0, height: 30))
                }
                
            }
        })
        
    }
}

#Preview {
    RecommendView()
}
