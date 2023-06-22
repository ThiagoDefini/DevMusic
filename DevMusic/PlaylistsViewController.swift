//
//  PlaylistsViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class PlaylistsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var categories: [MusicCollectionCategory] = MusicCollectionCategory.allCases
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let opcao = categories[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistsCell", for: indexPath) as! PlaylistsTableViewCell
        cell.label.text = opcao.description
        cell.coverImage.image = UIImage(named: opcao.description)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let opcao = categories[indexPath.row]

        performSegue(withIdentifier: "goToPlaylist", sender: nil)
        
    }
}
