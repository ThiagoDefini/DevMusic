//
//  FavoritesViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let searchController = UISearchController()
    
    var musics: [Music] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var favorites: [Music] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Favorites"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.configureSearchbar()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        do{
            try favorites = MusicService().favoriteMusics
            try musics = MusicService().getAllMusics()
        }catch{
            favorites = []
            musics = []
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if musics.isEmpty{
            return 1
        }else{
            return musics.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if musics.isEmpty{
            return 300
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if musics.isEmpty{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesEmptyId", for: indexPath) as? FavoritesEmptyTableViewCell else {
                return UITableViewCell() }
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesId", for: indexPath) as? FavoritesTableViewCell else {
                return UITableViewCell() }
            
            cell.musicImage.image = UIImage(named: musics[indexPath.row].id)
            cell.nameLabel.text = musics[indexPath.row].title
            cell.bandLabel.text = musics[indexPath.row].artist
            
            return cell
        }
    }
    
    private func configureSearchbar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
    }

}

extension FavoritesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

