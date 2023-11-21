//
//  BooksViewModel.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import Foundation
import Combine

class BooksViewModel: ObservableObject {
    
    @Published var books: [Books] = []
    
    @Published var booksComingSoon: [BooksComingSoon] = []
    
    var isResponse: Bool = false
    
    private var cancellable: AnyCancellable?
    
    
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
    
    
    
    func fetchBooks() {
        if let url = URL(string: "https://gutendex.com/books/") {
            cancellable = URLSession.shared.dataTaskPublisher(for: url)
                .map(\.data)
                .decode(type: BooksResponse.self, decoder: JSONDecoder())
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        print("Error: \(error)")
                    }
                }, receiveValue: { [weak self] response in
                    self?.booksComingSoon = response.results
                    print("Respnse",self?.booksComingSoon as Any)
                    self?.isResponse = true
                })
        }
    }}
