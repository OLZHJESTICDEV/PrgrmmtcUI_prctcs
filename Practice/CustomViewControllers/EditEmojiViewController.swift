//
//  EditEmojiViewController.swift
//  Practice
//
//  Created by MAC on 23.06.2022.
//

import UIKit

protocol AddToFavDelegate: AnyObject {
    func addToFav(emoji: Emoji)
}

class EditEmojiViewController: UIViewController {
    var emojiLabelTF = UITextField()
    var emojiTitleTF = UITextField()
    var emojiDescriptionTF = UITextField()
    var emojiIsFavorite = UIButton()

    weak var addToFavDelegate: AddToFavDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        
        emojiIsFavorite.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
    }
    
    @objc private func addToFavorite(){
        addToFavDelegate?.addToFav(emoji: Emoji(
            emoji: "gdfa",
            name: "gdfa",
            description: "gdfa",
            isFavorite: true))
        
        dismiss(animated: true)
    }
    
    private func configure(){
        view.backgroundColor = .systemBackground

        
        emojiLabelTF.backgroundColor = .systemGray
        emojiTitleTF.backgroundColor = .systemGray
        emojiDescriptionTF.backgroundColor = .systemGray
        emojiIsFavorite.setTitle("Like", for: .normal)
        emojiIsFavorite.backgroundColor = .red
        
        view.addSubview(emojiLabelTF)
        view.addSubview(emojiTitleTF)
        view.addSubview(emojiDescriptionTF)
        view.addSubview(emojiIsFavorite)
        
        emojiLabelTF.translatesAutoresizingMaskIntoConstraints = false
        emojiTitleTF.translatesAutoresizingMaskIntoConstraints = false
        emojiDescriptionTF.translatesAutoresizingMaskIntoConstraints = false
        emojiIsFavorite.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            emojiLabelTF.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            emojiLabelTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emojiLabelTF.widthAnchor.constraint(equalToConstant: 250),
            emojiLabelTF.heightAnchor.constraint(equalToConstant: 50),
            
            emojiTitleTF.topAnchor.constraint(equalTo: emojiLabelTF.bottomAnchor, constant: 30),
            emojiTitleTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emojiTitleTF.widthAnchor.constraint(equalToConstant: 250),
            emojiTitleTF.heightAnchor.constraint(equalToConstant: 50),

            
            emojiDescriptionTF.topAnchor.constraint(equalTo: emojiTitleTF.bottomAnchor, constant: 30),
            emojiDescriptionTF.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emojiDescriptionTF.widthAnchor.constraint(equalToConstant: 250),
            emojiDescriptionTF.heightAnchor.constraint(equalToConstant: 50),

            
            emojiIsFavorite.topAnchor.constraint(equalTo: emojiDescriptionTF.bottomAnchor, constant: 30),
            emojiIsFavorite.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            emojiIsFavorite.heightAnchor.constraint(equalToConstant: 50),
            //emojiIsFavorite.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)

        ])
    
        
    }

}
