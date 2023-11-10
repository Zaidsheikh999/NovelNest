//
//  NovelNestApp.swift
//  NovelNest
//
//  Created by Zaid on 07/11/2023.
//

import SwiftUI

@main
struct NovelNestApp: App {
    
    init() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = .clear// Or any color you want for the background
        appearance.shadowColor = .white // This hides the border
        
        // Set the appearance for all navigation bar states
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView(){
                OnBoardingScreen()
            }
            .accentColor(.black)
            .navigationBarHidden(true)
            .navigationBarColor(backgroundColor: .white, tintColor: .black)
        }
    }
}






// This struct conforms to `UIViewControllerRepresentable`
struct NavigationBarModifier: UIViewControllerRepresentable {
    var backgroundColor: UIColor?
    var tintColor: UIColor?
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController() // We only need the modifier methods
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = backgroundColor // Set your custom color
        
        // Use this if NavigationBar title and items color need to be changed
        appearance.titleTextAttributes = [.foregroundColor: tintColor ?? .white]
        appearance.largeTitleTextAttributes = [.foregroundColor: tintColor ?? .white]
        
        // Set the appearance on the navigation bar
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        
        // Set the tint color for navigation items
        UINavigationBar.appearance().tintColor = tintColor
    }
}


// Extend `View` to use this modifier more easily
extension View {
    func navigationBarColor(backgroundColor: UIColor?, tintColor: UIColor?) -> some View {
        overlay(NavigationBarModifier(backgroundColor: backgroundColor, tintColor: tintColor)
            .frame(width: 0, height: 0)
        )
    }
}
