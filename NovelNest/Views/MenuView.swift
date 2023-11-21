//
//  MenuView.swift
//  NovelNest
//
//  Created by Zaid on 10/11/2023.
//

import SwiftUI

struct MenuView: View {
    
    // For Back Button
    @Environment (\.presentationMode) private var presentationMode
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        ScrollView(){
            VStack{
                
            }
        }
        .navigationBarItems(
            leading:
                BackButton(action: {
                    dismiss()
                })
        )
    }
}

#Preview {
    MenuView()
}
