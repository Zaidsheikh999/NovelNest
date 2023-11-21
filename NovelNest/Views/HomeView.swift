//
//  HomeView.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var vm = BooksViewModel()
    
    @State private var myBooksView = false
    
    @State private var menuPresent = false
    
    var body: some View {
        VStack(alignment:.leading, spacing:10) {
            HStack{
                AppMenuButton(action: menu)
                
                Spacer()
                
                ProfileButton(action: print)
            }
            .background(.clear)
            .padding(.horizontal,25)
            
            ScrollView(.vertical){
                HStack{
                    HStack(alignment: .top){
                        VStack(alignment: .leading,spacing: 10){
                            Text("Find best Books")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                            
                            Text("Today!")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundColor(.black)
                        }
                        .padding(30)
                    }
                    .background(.white)
                    .cornerRadius(30)
                    .shadow(color: .gray.opacity(0.2),radius: 10)
                    
                    Spacer()
                    VStack{
                        HStack(alignment: .bottom,spacing: 5){
                            Image(systemName: "magnifyingglass")
                            Text("/")
                            Image(systemName: "mic")
                        }
                        .padding(15)
                    }
                    .background(.white)
                    .cornerRadius(25.0)
                    .offset(x:-120, y: 25)
                    .shadow(color: .gray.opacity(0.2),radius: 10, x: 6)
                }
                .padding(.top,20)
                .padding(.leading,25)
                
                
                SectionHeader(title: "My Books", BtnTitle: "see more", action: { self.myBooksView = true })
                    .padding(.top, 35)
                // Navigate the screen to MyBooksView
                NavigationLink(destination: MyBooksView()
                    .navigationTitle("My Books")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarBackButtonHidden(false)
                    .navigationBarHidden(false), isActive: $myBooksView) {
                        EmptyView()
                    }
                
                ScrollView(.horizontal,showsIndicators: false){
                    HStack(spacing: 20){
                        ForEach((vm.books).enumerated().filter{(0...3).contains($0.offset)}.map{$1}){ book in
                            BookItem(book: book,width: 170,height: 250)
                        }
                    }
                    .padding(20)
                }
                
                SectionHeader(title: "Coming Soon", BtnTitle: "see more", action: {})
                    .padding(.top, 20)
                
                
                ScrollView(.horizontal, showsIndicators: false){
                    if vm.isResponse == true{
                        HStack(spacing: 20){
                            ForEach((vm.booksComingSoon).enumerated().filter{(0...2).contains($0.offset)}.map{$1}, id: \.id){ book in
                                BookBanner(book: book)
                            }
                        }
                        .padding(20)
                    } else{
                        ProgressView()
                            .padding(.leading,UIScreen.main.bounds.width / 2)
                    }
                }
            }
        }
        .sheet(isPresented: $menuPresent, content: {
            NavigationView {
                MenuView()
                    .transition(.move(edge: .bottom))
                    .animation(.easeInOut(duration: 0.3))
            }
        })
        
        .onAppear(){
            vm.fetchBooks()
        }
    }
    
    func print(){
        Swift.print("profile")
    }
    
    func menu(){
        Swift.print("menu")
        self.menuPresent = true
    }
}

#Preview {
    HomeView()
}
