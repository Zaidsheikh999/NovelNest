//
//  SectionHeader.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import SwiftUI

struct SectionHeader: View {
    
    @State var title: String
    @State var BtnTitle:String
    
    let action: () -> Void
    
    var body: some View {
            
        HStack{
            Text(title)
                .font(.system(size: 18, weight: .semibold))
            
            Spacer()
            
            Button(action: {
                action()
            }, label: {
                Text(BtnTitle)
                    .font(.system(size: 14, weight: .light))
                    .foregroundColor(.gray)
                    .underline()
            })
            
        }
        .padding(.horizontal, 20)
    }
}

//#Preview {
//    SectionHeader()
//}
