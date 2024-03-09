//
//  OnboardingItemView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 9/2/2567 BE.
//

import SwiftUI

struct OnboardingItemView: View {
    var data: OnboardingData
    var getStartedAction: (() -> Void)? = nil
    
    var body: some View {
        VStack {
//            Spacer()
//            ZStack {
//                if let backgroundImage = data.backgroundImage {
//                    Image(backgroundImage)
//                        .resizable()
//                        .scaledToFit()
//                }
                
                Image(data.objectImage)
//                    .resizable()
//                    .scaledToFit()
                    .offset(x: 0, y: 75)
//            }
            
            Spacer(minLength: 32)
//            Spacer()
            
            Text(data.primaryText)
                .font(.title)
                .bold()
                .padding([.leading, .trailing, .bottom])
                .lineLimit(1)
                .minimumScaleFactor(0.1) // adjust font size to fit width
                .foregroundStyle(Color(red: 41/255, green: 52/255, blue: 73/255))
            
            Text(data.secondaryText)
                .font(.callout)
                .multilineTextAlignment(.center)
//                .frame(maxWidth: 250)
//                .foregroundStyle(Color(red: 237/255, green: 203/255, blue: 150/255))
                .foregroundStyle(.black)
                .shadow(color: .black.opacity(0.1), radius: 1, x: 2, y: 2)
                .padding([.leading, .trailing], 50)
            
            Spacer()
            Button {
                // Add action
                getStartedAction?()
            } label: {
                Text("Get Started")
                    .font(.headline)
                    .foregroundStyle(.white)
                    .padding(.horizontal, 50)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.main)
                    )
            }
            .shadow(radius: 10)
            
            Spacer()

        }
    }
}

#Preview {
    let data = OnboardingData(id: 0,
//                              backgroundImage: "",
                              objectImage: "onboarding_01",
                              primaryText: "Welcome to Wanderlust!",
                              secondaryText: "Explore, plan, and make memories with Wanderlust. Let's embark on your next adventure!")
    
    return NavigationStack {
        OnboardingItemView(data: data)
    }
}
