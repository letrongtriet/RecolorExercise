//
//  BookVolumesTableViewController.swift
//  RecolorExercise
//
//  Created by Trong Triet Le on 12/02/2019.
//  Copyright © 2019 Nets AS. All rights reserved.
//

import UIKit
import SafariServices

class BookVolumesTableViewController: UITableViewController {

    let dataSource = BookVolumesDataSource()
    
    var shelfId: Int?
    var shelfTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource.dataChanged = { [weak self] in
            self?.tableView.reloadData()
        }
        
        guard let tempShelfId = self.shelfId else {return}
        
        let urlString = "https://www.googleapis.com/books/v1/users/103841219994607543260/bookshelves/\(String(tempShelfId))/volumes?access_token=165742784289-g81jsfd153tnhtmqv8kh1djoo5c7fqks.apps.googleusercontent.com"
        
        dataSource.fetch(urlString)
        tableView.dataSource = dataSource
        
        tableView.tableFooterView = UIView()
        
        self.navigationItem.title = self.shelfTitle
        
        tableView.register(UINib(nibName: "ShelfCustomCell", bundle: nil), forCellReuseIdentifier: "cellid")
        
        tableView.rowHeight = 200
        
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Find a book"
        navigationItem.searchController = search
        
        self.definesPresentationContext = true
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard let filteredItems = self.dataSource.filteredBookVolumes else {return}
        guard let cell = cell as? ShelfCustomCell else {return}
        
        let shelf = filteredItems[indexPath.row]
        cell.volumeTitle.text = shelf.volumeInfo.title
        cell.volumeVersion.text = shelf.volumeInfo.contentVersion
        cell.volumeDescription.text = shelf.volumeInfo.subtitle ?? ""
        
        guard let url = URL(string: shelf.volumeInfo.imageLinks.smallThumbnail) else {
            fatalError("Invalid URL passed.")
        }
        
        cell.volumeImage.load(url: url)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let filteredItems = self.dataSource.filteredBookVolumes else {return}
        let shelf = filteredItems[indexPath.row]
        
        guard let url = URL(string: shelf.volumeInfo.previewLink) else {
            fatalError("Invalid URL passed.")
        }
        
        let safariVC = SFSafariViewController(url: url)
        self.present(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
}

extension BookVolumesTableViewController: SFSafariViewControllerDelegate {
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true) {
            controller.delegate = nil
        }
    }
}

extension BookVolumesTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        self.dataSource.filterText = searchController.searchBar.text
    }
}
