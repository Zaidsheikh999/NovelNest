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


