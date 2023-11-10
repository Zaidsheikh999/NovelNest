//
//  MenuButton.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import Foundation
import SwiftUI

struct AppMenuButton: View {
   
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            VStack{
                Image("menu")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(.white)
                    .padding(10)
                    .frame(width: 40, height: 40, alignment: .center)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
            .background(.white)
            .cornerRadius(10.0)
            .shadow(color: .gray.opacity(0.3),radius: 15)
        })
        .buttonStyle(PressableButtonStyle())
    }
}
//
//#Preview{
//    AppMenuButton()
//}
