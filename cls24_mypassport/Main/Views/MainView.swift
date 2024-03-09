//
//  MainView.swift
//  cls24_mypassport
//
//  Created by Nathapong Masathien on 2/3/24.
//

import SwiftUI

enum TabbarItems: Int, CaseIterable {
    case reccommend = 0
    case achieved
    case profile
    
    var title: String {
        switch self {
        case .reccommend:
            return "Reccommends"
        case .achieved:
            return "Achieved"
        case .profile:
            return "Profile"
        }
    }
    
    var icon: String {
        switch self {
        case .reccommend:
            return "maps"
        case .achieved:
            return "achieved"
        case .profile:
            return "profile"
        }
    }
}

struct MainView: View {
    
    @State private var selectedTab = 0
    
    func CustomTabItem(title: String, icon: String, isActive: Bool) -> some View {
        HStack {
            Spacer()
            Image(icon)
                .resizable()
                .renderingMode(.template)
                .foregroundStyle(isActive ? .black : .gray)
                .frame(width: 20, height: 20)
            if isActive {
                Text(title)
                    .font(.system(size: 14))
                    .foregroundStyle(isActive ? .black : .gray)
            }
            Spacer()
        }
        .frame(width: isActive ? .infinity : 60, height: 60)
        .background(isActive ? .main.opacity(0.8) : .clear)
        .clipShape(RoundedRectangle(cornerRadius: 30))
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            TabView(selection: $selectedTab) {
                Group {
                    RecommendView()
                        .tag(0)
//                .tabItem {
//                    Image("maps")
//                    Text("Home")
//                }
                    
                    PassportView()
                        .tag(1)
//                .tabItem {
//                    Image("achieved")
//                    Text("Achieved")
//                }
                    
                    ProfileView()
                        .tag(2)
//                .tabItem {
//                    Image("profile")
//                    Text("Profile")
//                }
                }
                .toolbarBackground(.hidden, for: .tabBar)
            }
            
            ZStack {
                HStack {
                    ForEach(TabbarItems.allCases, id: \.self) { item in
                        Button(action: {
                            selectedTab = item.rawValue
                        }, label: {
                            CustomTabItem(title: item.title, icon: item.icon, isActive: (selectedTab == item.rawValue))
                        })
                    }
                }
                .padding(6)
            }
            .frame(height: 70)
            .background(.main.opacity(0.2))
            .clipShape(RoundedRectangle(cornerRadius: 35))
            .padding(.horizontal, 50)
        }
    }
}

#Preview {
    MainView().environment(AuthViewModel())
}
