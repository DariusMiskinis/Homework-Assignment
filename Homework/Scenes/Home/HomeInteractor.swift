//
//  HomeInteractor.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

protocol HomeInteractable {
    func getDadJoke()
    func getChuckNorrisFact()
}

final class HomeInteractor {
    var presenter: HomePresentable?

    private let dadJokesService: DadJokesProvidable
    private let chuckNorrisFactsService: ChuckNorrisFactsProvidable

    init(dadJokesService: DadJokesProvidable, chuckNorrisFactsService: ChuckNorrisFactsProvidable) {
        self.dadJokesService = dadJokesService
        self.chuckNorrisFactsService = chuckNorrisFactsService
    }

}

extension HomeInteractor: HomeInteractable {

    func getDadJoke() {
        Task { @MainActor in
            do {
                let joke = try await dadJokesService.getDadJoke()
                presenter?.presentDetails(text: joke.interestingText, typeOfInformation: .dadJoke)
            } catch {
                presenter?.showError(error: error, typeOfInformation: .dadJoke)
            }
        }
    }

    func getChuckNorrisFact() {
        Task { @MainActor in
            do {
                let fact = try await chuckNorrisFactsService.getChuckNorrisFact()
                presenter?.presentDetails(text: fact.interestingText, typeOfInformation: .chuckNorrisFact)
            } catch {
                presenter?.showError(error: error, typeOfInformation: .chuckNorrisFact)
            }
        }
    }
}
