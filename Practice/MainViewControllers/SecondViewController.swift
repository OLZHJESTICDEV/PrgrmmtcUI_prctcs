//
//  SecondViewController.swift
//  Practice
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    var favoriteEmoji = [
        Emoji(emoji: "🥲", name: "Cry", description: "Don't cry!", isFavorite: true),
        Emoji(emoji: "😁", name: "Smile", description: "Let's smile!", isFavorite: true),
        Emoji(emoji: "😍", name: "Love", description: "Love is good", isFavorite: true),
        Emoji(emoji: "😍", name: "Love", description: "Love is good", isFavorite: true),
    ]
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Second"
        
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .yellow
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: EmojiTableViewCell.identifier)
        tableView.rowHeight = 50

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            //tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20),
            tableView.heightAnchor.constraint(equalToConstant: 400),
            //tableView.widthAnchor.constraint(equalToConstant: 150)
        ])
        
        let rootVC = EditEmojiViewController()
        rootVC.addToFavDelegate = self
        
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favoriteEmoji.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.identifier, for: indexPath) as! EmojiTableViewCell
        
        cell.emojiLabel.text = favoriteEmoji[indexPath.row].emoji
        cell.emojiTitle.text = favoriteEmoji[indexPath.row].name
        
        return cell
    }
    
}

extension SecondViewController: AddToFavDelegate {
    func addToFav(emoji: Emoji) {
        favoriteEmoji.append(emoji)
        tableView.reloadData()
    }
}
