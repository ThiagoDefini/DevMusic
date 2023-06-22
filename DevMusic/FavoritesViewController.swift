//
//  FavoritesViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class FavoritesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let searchController = UISearchController()
    
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
            try favorites = MusicService.singleton.favoriteMusics
        }catch{
            favorites = []
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if favorites.isEmpty{
            return 1
        }else{
            return favorites.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if favorites.isEmpty{
            return 300
        }else{
            return 100
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if favorites.isEmpty{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesEmptyId", for: indexPath) as? FavoritesEmptyTableViewCell else {
                return UITableViewCell() }
            
            return cell
        }else{
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesId", for: indexPath) as? FavoritesTableViewCell else {
                return UITableViewCell() }
            
            cell.musicImage.image = UIImage(named: favorites[indexPath.row].id)
            cell.nameLabel.text = favorites[indexPath.row].title
            cell.bandLabel.text = favorites[indexPath.row].artist
            
            return cell
        }
    }
    
    private func isFavorited(music: Music) -> Bool{
        if favorites.contains(music){
            return true
        }else{
            return false
        }
    }
    
    private func configureSearchbar() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Artists, Songs, Lyrics, and More"
        navigationItem.searchController = searchController
    }

    
    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToPlayMusic", sender: self.favorites[indexPath.row])
    }
    
    //Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPlayMusic"{
            guard let destination = segue.destination as? UINavigationController else { return }
            guard let vc = destination.topViewController as? PlayMusicViewController else { return }
            guard let musicPicked = sender as? Music else { return }
            
            vc.music = musicPicked
            
            
        }
        
        
    }
    
}

extension FavoritesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
    }
}

