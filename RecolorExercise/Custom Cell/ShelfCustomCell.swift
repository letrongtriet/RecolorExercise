//
//  ShelfCustomCell.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit

class ShelfCustomCell: UITableViewCell {
    @IBOutlet weak var volumeImage: UIImageView!
    @IBOutlet weak var volumeTitle: UILabel!
    @IBOutlet weak var volumeVersion: UILabel!
    @IBOutlet weak var volumeDescription: UILabel!
    
    override func prepareForReuse() {
        self.volumeImage.image = nil
        self.volumeTitle.text?.removeAll()
        self.volumeVersion.text?.removeAll()
        self.volumeDescription.text?.removeAll()
    }
}
