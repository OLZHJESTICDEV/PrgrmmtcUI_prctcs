//
//  FirstVCLayout.swift
//  Practice
//
//  Created by MAC on 23.06.2022.
//

import UIKit

class FirstVCLayout: UIView {
    let mainScrollView = UIScrollView()
    let contentView = UIView()
    let backgroundImage = UIImageView()
    
    let cardView = UIView()
    let bannerImage = UIImageView()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    let descriptionLabel = UILabel()
    
    let tableView = UITableView()
    let addEmojiButton = UIButton()


    override init(frame: CGRect){
        super.init(frame: frame)
        
        //Настройка view здесь
        backgroundColor = .gray //если нужно достучаться до view, то просто указываем
        
        configure()
        constraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(){
        cardView.backgroundColor = UIColor(named: "BlurBackground")
        //cardView.backgroundColor = .red
        cardView.layer.cornerRadius = 10
        cardView.layer.cornerCurve = .continuous

        bannerImage.image = UIImage(named: "star-struck")
        titleLabel.text = "Title"
        subtitleLabel.text = "Subtitle"
        descriptionLabel.text = "Description"
        
        tableView.rowHeight = 80
        
        addEmojiButton.setTitle("Add new emoji", for: .normal)
        addEmojiButton.backgroundColor = .systemPink
    }
    
    func constraint(){
        //Card View elements
        cardView.addSubview(bannerImage)
        cardView.addSubview(titleLabel)
        cardView.addSubview(subtitleLabel)
        cardView.addSubview(descriptionLabel)

        bannerImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            bannerImage.widthAnchor.constraint(equalToConstant: 130),
            bannerImage.heightAnchor.constraint(equalToConstant: 130),
            bannerImage.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 35),
            bannerImage.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: bannerImage.trailingAnchor, constant: 20),
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            subtitleLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            
            descriptionLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
            descriptionLabel.leadingAnchor.constraint(equalTo: subtitleLabel.leadingAnchor)
        ])
        
        
        //CardView
        contentView.addSubview(cardView)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            cardView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            cardView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            cardView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            cardView.heightAnchor.constraint(equalToConstant: 200)
            //cardView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -150),
        ])
        
        //Table View
        contentView.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: cardView.bottomAnchor, constant: 15),
            tableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            tableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
            tableView.heightAnchor.constraint(equalToConstant: 200)
        ])
        
        //Add emoji button
        contentView.addSubview(addEmojiButton)
        addEmojiButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            addEmojiButton.heightAnchor.constraint(equalToConstant: 50),
            addEmojiButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            addEmojiButton.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 15),
            addEmojiButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        ])
        
        //Main ScrollView
        addSubview(mainScrollView)
        mainScrollView.translatesAutoresizingMaskIntoConstraints = false
        mainScrollView.backgroundColor = UIColor(named: "PrimaryBackground")
        
        NSLayoutConstraint.activate([
            mainScrollView.topAnchor.constraint(equalTo: topAnchor),
            mainScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
            mainScrollView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
        
        //BackgroundImage
        mainScrollView.addSubview(backgroundImage)
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.image = UIImage(named: "Background01")
        backgroundImage.contentMode = .scaleAspectFill
        
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundImage.widthAnchor.constraint(equalTo: widthAnchor)
        ])

        
        //ContentView
        mainScrollView.addSubview(contentView)
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.backgroundColor = .none
        
        let contentViewCenterY = contentView.centerYAnchor.constraint(equalTo: mainScrollView.centerYAnchor)
        contentViewCenterY.priority = .defaultLow
        let contentViewHeight = contentView.heightAnchor.constraint(greaterThanOrEqualTo: heightAnchor)
        contentViewHeight.priority = .defaultLow
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.trailingAnchor),
            contentView.leadingAnchor.constraint(equalTo: mainScrollView.contentLayoutGuide.leadingAnchor),
            contentView.centerXAnchor.constraint(equalTo: mainScrollView.centerXAnchor),
            contentViewCenterY,
            contentViewHeight
        ])
    }
}

