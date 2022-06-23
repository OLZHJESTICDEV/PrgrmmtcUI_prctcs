//
//  CreateEmojiViewController.swift
//  Practice
//
//  Created by MAC on 23.06.2022.
//

import UIKit

protocol CreateEmojiDelegate: AnyObject {
    func createEmoji(emoji: Emoji)
}

class CreateEmojiViewController: UIViewController {
    weak var createEmojiDelegate: CreateEmojiDelegate?
    
    let button1 = UIButton()
    let button2 = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configure()
        
        button1.addTarget(self, action: #selector(chooseFirstEmoji), for: .touchUpInside)
        button2.addTarget(self, action: #selector(chooseSecondEmoji), for: .touchUpInside)
    }
    
    @objc private func chooseFirstEmoji(){
        createEmojiDelegate?.createEmoji(emoji: Emoji(emoji: "😁", name: "Laugh", description: "Looool!", isFavorite: false))
    }
    
    @objc private func chooseSecondEmoji(){
        createEmojiDelegate?.createEmoji(emoji: Emoji(emoji: "🥲", name: "Cry", description: "Cryyyy!", isFavorite: false))
    }
    
    
    
    private func configure(){
        button1.setTitle("😁", for: .normal)
        button2.setTitle("🥲", for: .normal)
        button1.backgroundColor = .systemBlue
        button2.backgroundColor = .systemMint
        
        
        view.addSubview(button1)
        view.addSubview(button2)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            button1.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            button1.widthAnchor.constraint(equalTo: button2.widthAnchor),
            
            button2.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            button2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50)
        ])
        
    }
    
}
