//
//  CarouselView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 2/3/24.
//

import SwiftUI

struct CarouselData: Identifiable {
    let id = UUID()
    let imageURL: String
    let title: String
    let description: String
}

struct CarouselView: View {
    
    var list: [CarouselData] = []
    //    var width: CGFloat = .infinity
    var height: CGFloat = 450
    private let spacing: CGFloat = 20
    @Binding var currentScrollIndex: Int?
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 0) {
                ForEach(Array(list.enumerated()), id: \.element.id) { index, data in
                    CarouselItemView(data: data)
                        .id(index)
                        .frame(height: height)
                        .clipShape(RoundedRectangle(cornerRadius: 25.0))
                        .padding(.horizontal, spacing)
                        .containerRelativeFrame(.horizontal)
                        .scrollTransition(topLeading: .animated,
                                          bottomTrailing: .animated,
                                          axis: .horizontal) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1.0 : 0.8)
                                .scaleEffect(phase.isIdentity ? 1.0 : 0.8)
                        }
                }
                ForEach(list) { data in
                }
            }
            .scrollTargetLayout()
        }
        .frame(height: height)
        .scrollTargetBehavior(.paging)
        .scrollIndicators(.hidden)
        .scrollPosition(id: $currentScrollIndex)
    }
}

#Preview {
    let list = [
        CarouselData(imageURL: "https://picsum.photos/200/450", title: "Mount Fuji", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,"),
        CarouselData(imageURL: "https://picsum.photos/200/450", title: "Mount Fuji2", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,"),
        CarouselData(imageURL: "https://picsum.photos/200/450", title: "Mount Fuji3", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum gravida urna arcu, nec accumsan urna porta vitae. Sed facilisis tincidunt orci, eu varius libero volutpat quis. Mauris purus massa, suscipit sit amet neque in,")
        
    ]
    return CarouselView(list: list, currentScrollIndex: .constant(0))
}
