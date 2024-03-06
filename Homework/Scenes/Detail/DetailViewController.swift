//
//  DetailViewController.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-03.
//

import Foundation
import UIKit


struct DetailViewModel {
    let text: String
    let image: UIImage
}

final class DetailViewController: UIViewController {

    private let detailView = DetailView()
    private let viewModel: DetailViewModel

    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDetailView()
        updateText()
        updateImage()
    }

    private func addDetailView() {
        view = detailView
    }

    private func updateText() {
        detailView.updateText(text: viewModel.text)
    }

    private func updateImage() {
        detailView.updateImage(image: viewModel.image)
    }
}
