//
//  SongsViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class SongsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var musics: [Music] = []
    var musicService: MusicService? = try? MusicService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        guard let musicService = self.musicService else { return }
        musics = musicService.getAllMusics()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadData()
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let music = musics[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongsCell", for: indexPath) as! SongsTableViewCell
        cell.coverImage.image = UIImage(named: music.id)
        cell.title.text = music.title
        cell.subtitle.text = music.artist
        return cell
    }
    
    //Delegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToPlayMusic", sender: self.musics[indexPath.row])
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
