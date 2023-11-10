//
//  ProfileButton.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import SwiftUI

struct ProfileButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Image("profile")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 40,height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black, lineWidth: 1))
                .shadow(color: .black.opacity(0.3),radius: 10)
        })
        .buttonStyle(PressableButtonStyle())
    }
}

//#Preview {
//    ProfileButton()
//}
