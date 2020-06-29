//
//  HomeTableViewCell.swift
//  CountryFactsPOC
//
//  Created by Biswas, Mahammad Sahnawaj on 28/06/20.
//  Copyright © 2020 Biswas, Mahammad Sahnawaj. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    // Properties
    private let containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 0.5
        view.backgroundColor = UIColor.white
        return view
    }()

   private let imageview: UIImageView = {
        let img = UIImageView.init(image: UIImage(named: "placeholder"))
        img.contentMode = .scaleAspectFill
        img.translatesAutoresizingMaskIntoConstraints = false
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        img.layer.borderWidth = 2
        img.layer.borderColor = UIColor.gray.cgColor
        return img
    }()

    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.avenirBlack(ofSize: 17)
        label.textColor = UIColor.factTitleColor()
        label.numberOfLines = 0
        return label
    }()

    private let detailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = UIFont.avenirBlack(ofSize: 14)
        label.textColor =  UIColor.descriptionColor()
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        // Adding image view in container
        containerView.addSubview(imageview)
        // Adding title label in container
        containerView.addSubview(nameLabel)
        // Adding description label in container
        containerView.addSubview(detailLabel)
        contentView.addSubview(containerView)
        addConstraints() // adding contarints on all subview which added on cell container
        self.selectionStyle = .none
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Grouping all subviews Autolayout costarints
    private func addConstraints() {
        addConstraintsContainerView()
        addConstraintsImageView()
        addConstraintsTitltLbl()
        addConstraintsdescription()
    }

    // Adding autolayout constraints on Container View
    fileprivate func addConstraintsContainerView() {
        containerView.addShadow(offset: CGSize.init(width: 0, height: 3), color: UIColor.gray, radius: 4.0, opacity: 0.45)
        containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: 66).isActive = true
        containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8).isActive = true
        containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8).isActive = true
        containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
    }

    // Adding autolayout constraints on Imageview
    fileprivate func addConstraintsImageView() {
        imageview.translatesAutoresizingMaskIntoConstraints = false
        imageview.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 8).isActive = true
        imageview.widthAnchor.constraint(equalToConstant: 50).isActive = true
        imageview.heightAnchor.constraint(equalToConstant: 50).isActive = true
        imageview.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8).isActive = true
    }

    // Adding autolayout constraints on title Label
    fileprivate func addConstraintsTitltLbl() {
        nameLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 5).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: imageview.trailingAnchor, constant: 10).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
    }

    // Adding autolayout constraints on description Label
    fileprivate func addConstraintsdescription() {
        detailLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor).isActive = true
        detailLabel.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -10).isActive = true
        detailLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -5).isActive = true
        detailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
    }

    // Setting Up Cell Detail With Row
    func updateCell(detail: Row) {
        nameLabel.text = detail.title
        detailLabel.text = detail.description
        if let imagePath = detail.imageHref {
            imageview.loadImageUsingCache(withUrl: imagePath)
        } else {
            imageview.image = UIImage(named: "placeholder")
        }
    }
}
