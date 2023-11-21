//
//  MainView.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//


import SwiftUI

struct Screen: Identifiable {
    var id = UUID()
    var label: String
    var icon_default: String
    var icon_active: String
    var tag: Int
}

struct MainView: View {

    @State var activeScreen: Int = 0;
    
    var screens: [Screen] = [
        .init(label: "Home", icon_default: "home_default", icon_active: "home_active", tag: 0),
        .init(label: "Explore", icon_default: "explore_default", icon_active: "explore_active", tag: 1),
        .init(label: "Notifications", icon_default: "notifications_default", icon_active: "notifications_active", tag: 2),
    ]
    
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
            ZStack {
                TabView(selection: $activeScreen) {
                    HomeView()
                        .tag(0)
                    ExploreView()
                        .tag(1)
                    NotificationsView()
                        .tag(2)
                }
                
                VStack(spacing: 0) {
                    Spacer()
                    HStack(spacing: 0) {
                        ForEach(screens) {screen in
                            let isActive = activeScreen == screen.tag
                            
                            Button {
                                withAnimation(.smooth) {
                                    activeScreen = screen.tag
                                }
                            } label: {
                                HStack(spacing: 0) {
                                    Image(isActive ? screen.icon_active : screen.icon_default)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 22, height: 22)
                                    
                                    if isActive {
                                        Text(screen.label)
                                            .font(.system(size: 12))
                                            .padding(.leading, 6)
                                            .foregroundColor(.white)
                                            .bold()
                                    }
                                }
                                .padding(.horizontal, isActive ? 12 : 24)
                                .padding(.leading, activeScreen == 0 && screen.tag == 1 ? 12 : 0)
                                .padding(.trailing, activeScreen == 1 && screen.tag == 0 ? 12 : 0)
                                .padding(.leading, activeScreen == 1 && screen.tag == 2 ? 12 : 0)
                                .padding(.trailing, activeScreen == 2 && screen.tag == 1 ? 12 : 0)
                                .padding(.leading, activeScreen == 2 && screen.tag == 3 ? 10 : 0)
                                .padding(.trailing, activeScreen == 3 && screen.tag == 2 ? 12 : 0)
                                .animation(.spring(response: 0.5, dampingFraction: 0.8))
                                .frame(height: 40)
                                .background(Color.black.opacity(isActive ? 1.0 : 0.0))
                                .cornerRadius(20)
                                .clipped()
                            }
                        }
                    }
                    .padding(15)
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: Color.gray.opacity(0.4),radius: 10)
                }
            }
//            .navigationBarItems(leading: AppMenuButton())
    }
}

#Preview {
    MainView()
}
