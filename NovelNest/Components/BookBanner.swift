//
//  BookBanner.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import SwiftUI

struct BookBanner: View {
    
    let book: BooksComingSoon
    
    var truncatedText: String {
        if book.title.count > 25 {
            return String(book.title.prefix(25 - 3)) + "..."
        } else {
            return book.title
        }
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            HStack(spacing: 20){
                if let url = URL(string: book.formats["image/jpeg"] ?? "") {
                    AsyncImage(url: url) { image in
                        // Display the image
                        image.resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 250)
                            .clipShape(RoundedRectangle(cornerRadius: 40))
                            .shadow(color: .black.opacity(0.3),radius: 5)
                        
                    } placeholder: {
                        // Placeholder content while the image is loading
                        ProgressView()
                    }
                } else {
                    Text("Invalid URL")
                }
                
                
                VStack(alignment: .leading,spacing: 20){
                    VStack(alignment:.leading,spacing: 5){
                        Text(truncatedText)
                            .font(.system(size: 16, weight: .heavy))
                        
                        Text(book.authors.first?.name ?? "abc")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundStyle(.gray.opacity(0.7))
                    }
                    Button {
                        
                    } label: {
                        Text("Preview")
                            .fontWeight(.heavy)
                            .font(.system(size: 14))
                    }
                    .frame(width: 100, height: 40)
                    .background(.black)
                    .foregroundColor(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                }
                .offset(y:-70)
                
                Spacer()
                
            }
        }
    }
}

//#Preview {
//    BookBanner()
//}
