//
//  MyBooksView.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import SwiftUI

struct MyBooksView: View {
    
    let columns = [
        GridItem(.fixed(150),spacing: 30),
        GridItem(.fixed(150))
    ]
    
    @ObservedObject var vm = BooksViewModel()
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){
            LazyVGrid(columns: columns,spacing: 20){
                ForEach(vm.books){ book in
                    BookItem(book: book,width: 110, height: 180)
                }
            }
            .padding(20)
        }
    }
}

#Preview {
    MyBooksView()
}
