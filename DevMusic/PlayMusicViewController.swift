//
//  PlayMusicViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class PlayMusicViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var music: Music?
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Playing"

        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PlayMusicCell1", for: indexPath) as? PlayMusic1TableViewCell else {
            return UITableViewCell() }
        
        guard let music else { return UITableViewCell() }
        
        cell.music = music
        cell.fav = MusicService.singleton.favoriteMusics.contains(music)
        
        
        return cell
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
    }
    
    
    
}
