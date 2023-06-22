//
//  PlaylistViewController.swift
//  DevMusic
//
//  Created by Luana Tais Thomas on 19/06/23.
//

import UIKit

class PlaylistViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var musicService: MusicService? = try? MusicService()
    var musicColection: MusicCollection?
    var musics: [Music] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    var name: String = ""
    var cImage: String = ""
    
//    var sections: ([String], [Music])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let musicService = self.musicService else { return }
        musicColection = musicService.getCollection(id: "7vN82vd1Vq44fjlhjfvHJp")
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
        guard let musicColection = musicService.getCollection(id: "2YYAbfaPZGY0sZNdMVsr20") else {
            return
        }
        musics = musicColection.musics
        
        self.cImage = musicColection.id
        self.name = musicColection.title
        
        let icon1 = UIImage(systemName: "plus.circle.fill")
        let icon2 = UIImage(systemName: "ellipsis.circle")
        
        let iconButton1 = UIBarButtonItem(image: icon1, style: .plain, target: self, action: #selector(icon1Tapped))
        let iconButton2 = UIBarButtonItem(image: icon2, style: .plain, target: self, action: #selector(icon2Tapped))
                
        navigationItem.rightBarButtonItems = [iconButton1, iconButton2]
        
    }
    
    @objc func icon1Tapped() {
    }
    
    @objc func icon2Tapped() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.reloadData()
    }
    
    private func reloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        }
        return musics.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "CoverPlaylistCell", for: indexPath) as! CoverPlaylistTableViewCell
            cell.coverImage.image = UIImage(named: cImage)
            cell.title.text = name
            return cell
            
        } else {
            
            let music = musics[indexPath.row]
            let cell = tableView.dequeueReusableCell(withIdentifier: "PlaylistCell", for: indexPath) as! PlaylistTableViewCell
            cell.coverImage.image = UIImage(named: music.id)
            cell.title.text = music.title
            cell.subtitle.text = music.artist
            return cell
        }
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
