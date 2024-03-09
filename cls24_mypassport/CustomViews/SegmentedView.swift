//
//  SegmentedView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 7/3/24.
//

import SwiftUI

struct SegmentedView: View {
    
    let segments: [String]
    @Binding var selected: String
    
    @Namespace private var name
    private let barWidth: CGFloat = 20
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(segments, id: \.self) { segment in
                Button(action: {
                    selected = segment
                }, label: {
                    VStack {
                        Text(segment)
                            .font(.footnote)
                            .fontWeight(.medium)
                            .foregroundStyle(selected == segment ? .main : .subText)
                        ZStack {
                            Capsule()
                                .fill(.clear)
                                .frame(width: barWidth, height: 4)
                            if selected == segment {
                                Capsule()
                                    .fill(.main)
                                    .frame(width: barWidth, height: 4)
                                    .matchedGeometryEffect(id: "Tab", in: name)
                            }
                        }
                    }
                    .padding(.horizontal, 20)
                })
            }
        }
    }
}

#Preview {
    SegmentedView(segments: ["Option1", "Option2"], selected: .constant("Option1"))
}
