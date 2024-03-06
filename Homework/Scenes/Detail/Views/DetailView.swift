//
//  DetailView.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation
import UIKit

final class DetailView: UIView {

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let textLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let roundedCornerView: RoundedCornerTextView = {
        let view = RoundedCornerTextView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func updateImage(image: UIImage) {
        imageView.image = image
    }

    func updateText(text: String) {
        roundedCornerView.updateText(text: text)
    }

    private func setupSubviews() {
        addSubview(imageView)
        addSubview(roundedCornerView)
    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 32),

            roundedCornerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedCornerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedCornerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedCornerView.heightAnchor.constraint(equalToConstant: 256)
        ])
    }
}
