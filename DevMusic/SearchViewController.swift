//
//  SearchViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    
    let searchController = UISearchController()
    
    let cellId = "categoryCellId"
    
    var categories: [MusicCollectionCategory] = MusicCollectionCategory.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        self.title = "Search"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.configureSearchbar()
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell() }
        
//        cell.selectionStyle = .none
        cell.categoryImage.image = UIImage(named: categories[indexPath.row].description)
        cell.categoryLabel.text = categories[indexPath.row].description
        
        return cell
    }
    
    private func configureSearchbar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
    }

    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        tableView.dequeueReusableCell(withIdentifier: IndexPath)?.contentView.laye r.backgroundColor
        tableView.deselectRow(at: indexPath, animated: true)
    }

    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
}

extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}
