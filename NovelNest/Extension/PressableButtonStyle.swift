//
//  PressableButtonStyle.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import SwiftUI

struct PressableButtonStyle: ButtonStyle {

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .opacity(configuration.isPressed ? 0.8 : 1.0)

    }

}
