//
//  MainView.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-02.
//

import Foundation
import UIKit

protocol MainViewDelegate: AnyObject{
    func didTapDadJokeButton()
    func didTapChuckNorrisFactButton()
}

class MainView: UIView {

    weak var delegate: MainViewDelegate?

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Get a dad joke or a fact about Chuck Norris."
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    private let descriptionTextView: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .red
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "MainImage")
        return imageView
    }()

    private let roundedCornerView = RoundedCornerView()

    private lazy var dadJokeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dad joke", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .buttonBackground
        button.setTitleColor(.buttonText, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(getDadJokeTapped), for: .touchUpInside)

        return button
    }()

    private lazy var chuckNorrisFactButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Chuck Norris fact", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.backgroundColor = .buttonBackground
        button.setTitleColor(.buttonText, for: .normal)
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(getChuckNorrisFactTapped), for: .touchUpInside)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupSubviews() {
        let subviews: [UIView] = [
            imageView,
            roundedCornerView,
            titleLabel,
            dadJokeButton,
            chuckNorrisFactButton,
            descriptionTextView
        ]

        subviews.forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
            addSubview($0)
        }

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 32),

            roundedCornerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            roundedCornerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            roundedCornerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            roundedCornerView.heightAnchor.constraint(equalToConstant: 256),

            titleLabel.topAnchor.constraint(equalTo: roundedCornerView.topAnchor, constant: 32),
            titleLabel.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: roundedCornerView.trailingAnchor, constant: -16),

            dadJokeButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            dadJokeButton.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: 16),
            dadJokeButton.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -8),
            dadJokeButton.heightAnchor.constraint(equalToConstant: 40),

            chuckNorrisFactButton.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            chuckNorrisFactButton.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 8),
            chuckNorrisFactButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            chuckNorrisFactButton.heightAnchor.constraint(equalToConstant: 40),

            descriptionTextView.topAnchor.constraint(equalTo: dadJokeButton.bottomAnchor, constant: 32),
            descriptionTextView.leadingAnchor.constraint(equalTo: roundedCornerView.leadingAnchor, constant: 16),
            descriptionTextView.trailingAnchor.constraint(equalTo: roundedCornerView.trailingAnchor, constant: -16)
        ])
    }

    func updateDescription(with text: String) {
        descriptionTextView.text = text
    }

    @objc private func getDadJokeTapped() {
        delegate?.didTapDadJokeButton()
    }

    @objc private func getChuckNorrisFactTapped() {
        delegate?.didTapChuckNorrisFactButton()
    }
}
