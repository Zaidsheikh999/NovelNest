//
//  MenuButton.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import Foundation
import SwiftUI

struct MenuButton: View {
    
    @Environment (\.presentationMode) private var presentationMode
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Button(action: {
            presentationMode.wrappedValue.dismiss()
        }, label: {
            Image("Back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 25, height: 44, alignment: .leading)
        })
        .buttonStyle(PressableButtonStyle())
    }
}
