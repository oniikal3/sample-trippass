//
//  OnboardingView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 8/2/2567 BE.
//

import SwiftUI

struct OnboardingView: View {
    
    @State private var currentTab = 0
    @State private var startedActionClick = false
    
    private let list: [OnboardingData] = [
        OnboardingData(id: 0,
//                       backgroundImage: "",
                       objectImage: "onboarding_01",
                       primaryText: "Welcome to Wanderlust!",
                       secondaryText: "Explore, plan, and make memories with Wanderlust. Let's embark on your next adventure!"),
        OnboardingData(id: 1,
//                       backgroundImage: "",
                       objectImage: "onboarding_02",
                       primaryText: "Find Your Perfect Getaway",
                       secondaryText: "Discover destinations tailored to you, from beaches to cityscapes"),
        OnboardingData(id: 2,
//                       backgroundImage: "",
                       objectImage: "onboarding_03",
                       primaryText: "Personalized Recommendations",
                       secondaryText: "Get custom travel suggestions based on your interests and budget.")
    ]

    
    var body: some View {
        NavigationStack{
            TabView(selection: $currentTab,
                    content:  {
                ForEach(list) { viewData in 
                        OnboardingItemView(data: viewData, getStartedAction: getStartedActionHandler)
                            .tag(viewData.id)
                }
            })
            .tabViewStyle(PageTabViewStyle()) 
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
            .navigationDestination(isPresented: $startedActionClick) {
                LoginMethodsView()
            }
        }
    }
    
    private func getStartedActionHandler() {
        startedActionClick = true
    }
}

#Preview {
    OnboardingView()
}
