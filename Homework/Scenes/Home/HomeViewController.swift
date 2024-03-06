//
//  MainStartViewController.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import UIKit

protocol HomeViewControllable: AnyObject {
    func handleError(_ error: String)
    func showDetails(_ detailsViewModel: DetailViewModel)
}

class HomeViewController: UIViewController {

    var interactor: HomeInteractable?

    private let contentView = HomeView()

    override func viewDidLoad() {
        super.viewDidLoad()
        addContentView()
    }

    private func addContentView() {
        contentView.delegate = self
        view = contentView
    }
}

extension HomeViewController: HomeViewControllable {

    @MainActor
    func handleError(_ error: String) {
        contentView.updateDescription(with: error)
        print(error)
    }

    @MainActor
    func showDetails(_ detailsViewModel: DetailViewModel) {
        let detailViewController = DetailViewController(viewModel: detailsViewModel)
        navigationController?.pushViewController(detailViewController, animated: true)
    }
}

extension HomeViewController: MainViewDelegate {
    func didTapDadJokeButton() {
        interactor?.getDadJoke()
    }

    func didTapChuckNorrisFactButton() {
        interactor?.getChuckNorrisFact()
    }
}
