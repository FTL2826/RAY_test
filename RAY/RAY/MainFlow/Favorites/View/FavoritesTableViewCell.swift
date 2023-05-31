//
//  FavoritesTableViewCell.swift
//  RAY
//
//  Created by Alex Kharin on 5/31/23.
//

import UIKit

final class FavoritesTableViewCell: UITableViewCell {

    static let identifier: String = "FavoritesTableViewCell"
    
    lazy var queryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        label.text = "Not initilyzed"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    lazy var savedImage: UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 15
        iv.layer.shadowRadius = 5
        iv.layer.shadowColor = UIColor.black.cgColor
        iv.layer.shadowOpacity = 50
        iv.clipsToBounds = true
        iv.contentMode = .center
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ favorite: Favorite) {
        self.queryLabel.text = "Query was: \(favorite.query)"
        do {
            savedImage.image = UIImage(data: favorite.pictureData)
        } catch let error {
            print("Error with image in cell: \(error)")
            savedImage.image = UIImage(named: "questionmark")
        }
        
    }
    
    
    private func setupUI() {
        self.addSubview(queryLabel)
        self.addSubview(savedImage)
        
        NSLayoutConstraint.activate([
            queryLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
            queryLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            queryLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: 10),
            queryLabel.heightAnchor.constraint(equalToConstant: 30),
            
            savedImage.topAnchor.constraint(equalTo: queryLabel.bottomAnchor, constant: 20),
            savedImage.centerXAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerXAnchor),
            savedImage.widthAnchor.constraint(equalToConstant: 350),
            savedImage.heightAnchor.constraint(equalToConstant: 350),
        ])
    }

}
