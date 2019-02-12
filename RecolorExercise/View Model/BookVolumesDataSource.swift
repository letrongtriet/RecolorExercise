//
//  BookVolumesDataSource.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit

class BookVolumesDataSource: NSObject, UITableViewDataSource {
    var bookVolumes: [Item]?
    var filteredBookVolumes: [Item]?
    
    var dataChanged: (() -> Void)?
    
    var filterText: String? {
        didSet {
            filteredBookVolumes = bookVolumes?.matching(filterText)
            dataChanged?()
        }
    }
    
    func fetch(_ urlString: String) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        decoder.decode(BookVolumes.self, fromURL: urlString) { result in
            self.bookVolumes = result.items
            self.filteredBookVolumes = result.items
            self.dataChanged?()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredBookVolumes?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath) as! ShelfCustomCell
        return cell
    }
}
