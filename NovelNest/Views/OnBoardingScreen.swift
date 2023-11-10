//
//  OnBoardingScreen.swift
//  NovelNest
//
//  Created by Zaid on 07/11/2023.
//

import SwiftUI

struct OnboardingPage {
    let image: String
    let title: String
    let title2: String
    let description: String
}


struct OnBoardingScreen: View {
    let pages: [OnboardingPage] = [
        OnboardingPage(image: "onBoard", title: "Find Best", title2: "Books Today!", description: "Dive into a vast ocean of genres - from the thrilling realms of fantasy to the mind-bending alleys of science fiction. Discover new stories, classic tales, and insightful non-fiction. Your next great read is just a tap away!"),
        OnboardingPage(image: "onBoard2", title: "Personalized", title2: "Library!", description: "Build your own digital bookshelf. Keep your favorite reads and your future interests all in one place, accessible on any device. Tailor your library to your reading habits with personalized recommendations just for you."),
        OnboardingPage(image: "onBoard3", title: "Connect with", title2: "Community!", description: "Share your love of books with a community that cares. Rate books, leave reviews, and follow friends and authors to exchange recommendations. Be a part of book clubs and discussions that make reading a shared joy.")
    ]
    
    @State private var selection: Int = 0
    
    @State private var moveUp: Bool = false
    
    @State private var mainScreen: Bool = false
    
    var body: some View {
        ZStack{
            Color.darkGray
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                TabView(selection: $selection) {
                    ForEach(pages.indices, id: \.self) { index in
                        OnBoardingItem(page: pages[index])
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
                // Page Control
                HStack(spacing: 5) {
                    ForEach(pages.indices, id: \.self) { index in
                        if selection == index {
                            Capsule()
                                .fill(Color.white)
                                .frame(width: 30, height: 5)
                                .transition(.scale)
                        } else {
                            Capsule()
                                .fill(Color.gray)
                                .frame(width: 10, height: 5)
                                .transition(.scale)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.horizontal)
                .animation(.spring(), value: selection)
                
                // Start Button
                HStack(){
                    Spacer()
                    
                    Button {
                        self.mainScreen = true
                    } label: {
                        HStack{
                            Text("Start")
                                .fontWeight(.heavy)
                                .font(.system(size: 20))
                            HStack(spacing:-1){
                                Text("-")
                                    .fontWeight(.heavy)
                                    .font(.system(size: 20))
                                Image(systemName: "play.fill")
                            }
                            .offset(x: moveUp ? 5 : 15)
                            .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: moveUp)
                        }
                    }
                    .frame(width: 140, height: 60)
                    .background(.white)
                    .foregroundColor(.black)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                }
                .padding(.horizontal,20)
            }
            // MARK: - navigate the screen MainView
            NavigationLink(destination: MainView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true), isActive: $mainScreen) {
                    EmptyView()
                }
        }
        .onAppear(){
            self.moveUp = true
        }
    }
}


#Preview {
    OnBoardingScreen()
}



struct OnBoardingItem: View {
    
    let page: OnboardingPage
    
    var body: some View {
        VStack(spacing: 25){
            Image(page.image)
                .resizable()
                .frame(width: 400, height: 400)
            
            VStack(spacing: 10) {
                HStack(spacing: 15){
                    Text(page.title)
                        .font(.system(size: 45, weight: .heavy))
                        .foregroundStyle(.white)
                    
                    Image(systemName: "globe.asia.australia")
                        .resizable()
                        .foregroundColor(.white).opacity(0.5)
                        .frame(width: 30,height: 30)
                    
                    Spacer()
                }
                HStack {
                    Text(page.title2)
                        .font(.system(size: 45, weight: .heavy))
                        .foregroundStyle(.white)
                    
                    Spacer()
                }
                
                HStack {
                    Text(page.description)
                        .font(.system(size: 15, weight: .light))
                        .foregroundStyle(.white).opacity(0.6)
                    
                    Spacer()
                }
                
            }
            .padding(.horizontal,15)
            
        }
        
    }
}
