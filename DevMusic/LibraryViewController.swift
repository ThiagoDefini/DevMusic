//
//  LibraryViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class LibraryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var categories: [MusicCollectionType] = [.playlist, .artists, .songs]
    let segueIdentifierPlaylists: String = "goToPlaylists"
    let segueIdentifierArtists: String = "goToArtists"
    let segueIdentifierSongs: String = "goToSongs"
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as! LibraryTableViewCell
        cell.label.text = opcao.description
        cell.icon.image = UIImage(systemName: opcao.icon)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: segueIdentifierPlaylists, sender: nil)
        case 1:
            performSegue(withIdentifier: segueIdentifierArtists, sender: nil)
        case 2:
            performSegue(withIdentifier: segueIdentifierSongs, sender: nil)
        default:
            break
        }
    }
}
