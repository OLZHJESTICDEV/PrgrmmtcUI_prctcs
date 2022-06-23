//
//  FirstViewController.swift
//  Practice
//
//  Created by MAC on 22.06.2022.
//

import UIKit

class FirstViewController: UIViewController {
    
    lazy var contentView: FirstVCLayout = .init()
    
    var emojiList = [
        Emoji(emoji: "🥲", name: "Cry", description: "Don't cry!", isFavorite: true),
        Emoji(emoji: "😁", name: "Smile", description: "Let's smile!", isFavorite: false),
        Emoji(emoji: "😍", name: "Love", description: "Love is good", isFavorite: false),
    ]

    
    override func loadView() {
        view = contentView
        title = "Emoji" //Navbar title
        
        //Functionality here
        contentView.tableView.delegate = self
        contentView.tableView.dataSource = self
        contentView.tableView.register(EmojiTableViewCell.self, forCellReuseIdentifier: EmojiTableViewCell.identifier)
        
        contentView.addEmojiButton.addTarget(self, action: #selector(addNewEmoji), for: .touchUpInside)

    }
    
    @objc func addNewEmoji(){
        let rootVC = CreateEmojiViewController()
        rootVC.title = "Create Emoji"
        let navVC = UINavigationController(rootViewController: rootVC)
        rootVC.createEmojiDelegate = self
        present(navVC, animated: true)
    }
}


extension FirstViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return emojiList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EmojiTableViewCell.identifier, for: indexPath) as! EmojiTableViewCell
        
        cell.emojiLabel.text = emojiList[indexPath.row].emoji
        cell.emojiTitle.text = emojiList[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Передаем выбранную (нажатую) ячейку в делегат.
        tableView.deselectRow(at: indexPath, animated: true)
        
        let rootVC = EditEmojiViewController()
        rootVC.title = "Edit Emoji"
        let navVC = UINavigationController(rootViewController: rootVC)
        
        rootVC.emojiLabelTF.text = emojiList[indexPath.row].emoji
        rootVC.emojiTitleTF.text = emojiList[indexPath.row].name
        rootVC.emojiDescriptionTF.text = emojiList[indexPath.row].description

        present(navVC, animated: true)
        
        
        
    }
    
}

extension FirstViewController: CreateEmojiDelegate {
    func createEmoji(emoji: Emoji) {
        emojiList.append(emoji)
        contentView.tableView.reloadData()
    }
}
