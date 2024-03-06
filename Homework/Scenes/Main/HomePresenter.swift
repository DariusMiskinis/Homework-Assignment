//
//  HomePresenter.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-06.
//

import UIKit

protocol HomePresentable {
    func presentDetails(text: String, typeOfInformation: TypeOfInformation)
    func showError(error: Error, typeOfInformation: TypeOfInformation)
}

final class HomePresenter {
    weak var controller: HomeViewControllable!
}

extension HomePresenter: HomePresentable {

    @MainActor
    func presentDetails(text: String, typeOfInformation: TypeOfInformation) {
        let image: UIImage

        switch typeOfInformation {
        case .dadJoke:
            image = UIImage(named: "Dad")!
        case .chuckNorrisFact:
            image = UIImage(named: "ChuckNorris")!
        }

        let viewModel = DetailViewModel(text: text, image: image)
        controller.showDetails(viewModel)
    }

    @MainActor
    func showError(error: Error, typeOfInformation: TypeOfInformation) {
        let errorText: String

        switch typeOfInformation {
        case .dadJoke:
            errorText = "Error fetching dad joke: \(error)"
        case .chuckNorrisFact:
            errorText = "Error fetching Chuck Norris fact: \(error)"
        }
        
        controller.handleError(errorText)
    }

}


