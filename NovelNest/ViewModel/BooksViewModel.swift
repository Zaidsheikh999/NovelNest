//
//  BooksViewModel.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import Foundation

class BooksViewModel: ObservableObject {
    @Published var books: [Books] = []
    
    
    init(){
        addData()
    }
    
    func addData(){
        books = booksData
    }
    
    let booksData: [Books] = [
        Books(image: "book1", title: "The Mystery Woman",author: "Real Events"),
        Books(image: "book2", title: "Three Dark Crowns",author: "Kendare Black"),
        Books(image: "book3", title: "Girl In The Dark",author: "Anna Lyndsey"),
        Books(image: "book4", title: "The Silent Woman",author: "Real Events"),
        Books(image: "book2", title: "Three Dark Crowns",author: "Kendare Black"),
        Books(image: "book3", title: "Girl In The Dark",author: "Anna Lyndsey"),
        Books(image: "book2", title: "Three Dark Crowns",author: "Kendare Black"),
        Books(image: "book3", title: "Girl In The Dark",author: "Anna Lyndsey"),
        Books(image: "book1", title: "The Mystery Woman",author: "Real Events"),
        Books(image: "book2", title: "Three Dark Crowns",author: "Kendare Black"),
        Books(image: "book3", title: "Girl In The Dark",author: "Anna Lyndsey")
    ]
}
