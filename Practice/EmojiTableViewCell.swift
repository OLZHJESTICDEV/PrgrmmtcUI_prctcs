//
//  EmojiTableViewCell.swift
//  Practice
//
//  Created by MAC on 23.06.2022.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {
    
    
    static let identifier = "cell"
    
    var tableCellView = UIView()
    var emojiLabel = UILabel()
    var emojiTitle = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        addSubview(tableCellView)
        tableCellView.addSubview(emojiLabel)
        tableCellView.addSubview(emojiTitle)
        tableCellView.translatesAutoresizingMaskIntoConstraints = false
        emojiLabel.translatesAutoresizingMaskIntoConstraints = false
        emojiTitle.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableCellView.topAnchor.constraint(equalTo: topAnchor),
            tableCellView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableCellView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            emojiLabel.topAnchor.constraint(equalTo: tableCellView.topAnchor, constant: 15),
            emojiLabel.leadingAnchor.constraint(equalTo: tableCellView.leadingAnchor, constant: 15),
            emojiLabel.widthAnchor.constraint(equalToConstant: 25),
            emojiLabel.heightAnchor.constraint(equalToConstant: 15),
            
            emojiTitle.topAnchor.constraint(equalTo: tableCellView.topAnchor, constant: 15),
            emojiTitle.leadingAnchor.constraint(equalTo: emojiLabel.trailingAnchor, constant: 15),
        ])

        
    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
