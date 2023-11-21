//
//  Books.swift
//  NovelNest
//
//  Created by Zaid on 08/11/2023.
//

import Foundation

struct Books: Identifiable,Codable{
    var id = UUID()
    var image: String?
    var title: String?
    var author: String?
}




// MARK: - JailBreak Detection
//if UIDevice.current.isJailBroken {
//    showHBLGenericAlert(title: "Warning", description: "This device seem to be jail broken and can cause any security leak so please procees at your own risk", alertType: .Warning)
//}
