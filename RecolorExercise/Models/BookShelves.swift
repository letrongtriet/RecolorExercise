//
//  BookShelves.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import Foundation

struct BookShelves: Codable {
    let kind: String
    let items: [ShelfItem]
}

struct ShelfItem: Codable {
    let kind: String
    let id: Int
    let selfLink: String
    let title, access, updated, created: String
    let volumeCount: Int
    let volumesLastUpdated: String
}
