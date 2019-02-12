//
//  BookShelvesDataSource.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit

class BookShelvesDataSource: NSObject, UITableViewDataSource {
    var bookShelves: BookShelves?

    var dataChanged: (() -> Void)?
    
    func fetch(_ urlString: String) {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        
        decoder.decode(BookShelves.self, fromURL: urlString) { result in
            self.bookShelves = result
            self.dataChanged?()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookShelves?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellid", for: indexPath)
        let shelf = bookShelves?.items[indexPath.row]

        cell.textLabel?.text = shelf?.title
        cell.detailTextLabel?.text = "Updated: \(shelf?.volumesLastUpdated ?? "")"
        
        return cell
    }
}
