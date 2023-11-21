//
//  BackButton.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import Foundation
import SwiftUI

struct BackButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            Image("Back")
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.white)
                .frame(width: 25, height: 44, alignment: .leading)
        })
    }
}
