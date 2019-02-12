//
//  Array+RecolorExercise.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import Foundation

extension Array where Element == Item {
    func matching(_ text: String?) -> [Item] {
        if let text = text, text.count > 0 {
            return self.filter {
                $0.volumeInfo.title.contains(text)
            }
        } else {
            return self
        }
    }
}
