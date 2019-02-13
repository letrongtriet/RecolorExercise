//
//  GenericViewController.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit

class BookShelvesTableViewController: UITableViewController {
    
    let bookShelves = "https://www.googleapis.com/books/v1/users/103841219994607543260/bookshelves?access_token=165742784289-g81jsfd153tnhtmqv8kh1djoo5c7fqks.apps.googleusercontent.com"
    
    let dataSource = BookShelvesDataSource()
    
    var tempShelfId = 0
    var tempTitle = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        
        dataSource.fetch(bookShelves)
        tableView.dataSource = dataSource
        
        tableView.tableFooterView = UIView()
        
        tableView.register(UINib(nibName: "BookShelvesCustomCell", bundle: nil), forCellReuseIdentifier: "cellid")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let shelfId = self.dataSource.bookShelves?.items[indexPath.row].id else {return}
        guard let title = self.dataSource.bookShelves?.items[indexPath.row].title else {return}
        
        self.tempShelfId = shelfId
        self.tempTitle = title
        
        self.performSegue(withIdentifier: "showBookShelfDetail", sender: nil)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showBookShelfDetail" {
            if let controller = segue.destination as? BookVolumesTableViewController {
                controller.shelfId = self.tempShelfId
                controller.shelfTitle = self.tempTitle
            }
        }
    }
}
