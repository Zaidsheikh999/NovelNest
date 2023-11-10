//
//  BookItem.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import SwiftUI

struct BookItem: View {
    
    let book: Books
    
    let width: CGFloat!
    let height: CGFloat!
    
    var body: some View {
        
        VStack(){
            VStack(spacing:10){
                Image(book.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: width, height: height)
                    .clipShape(RoundedRectangle(cornerRadius: 40))
                    .shadow(color: .black.opacity(0.3),radius: 10)
                
                Text(book.title!)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
                    .lineLimit(1)
                
                Text(book.author!)
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.black)
                    .lineLimit(1)
            }
            .padding(.horizontal,20)
            .padding(.top,20)
            .padding(.bottom,20)
        }
        .background(.white)
        .clipShape(RoundedRectangle(cornerRadius: 40))
        .shadow(color: .black.opacity(0.1),radius: 10)
    }
}

//#Preview {
//    BookItem()
//}
