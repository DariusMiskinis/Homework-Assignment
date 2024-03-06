//
//  Injection.swift
//  Homework
//
//  Created by Darius Miskinis on 2024-03-05.
//

import Foundation
import Swinject

final class Injection {

    static let shared = Injection()
    private let container: Container = Container()

    init() {
        registerDependencies()
    }
    
    private func registerDependencies() {
        container.register(NetworkManagable.self) { _ in NetworkManager() }
            .inObjectScope(.container)

        container.register(DadJokesProvidable.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagable.self)!
            return DadJokesService(networkManager: networkManager)
        }

        container.register(ChuckNorrisFactsProvidable.self) { resolver in
            let networkManager = resolver.resolve(NetworkManagable.self)!
            return ChuckNorrisFactsService(networkManager: networkManager)
        }

        container.register(HomePresentable.self) { resolver in
            let presenter = HomePresenter()

            presenter.controller = resolver.resolve(HomeViewControllable.self)!

            return presenter
        }

        container.register(HomeInteractable.self) { resolver in
            let interactor = HomeInteractor()

            interactor.dadJokesService = resolver.resolve(DadJokesProvidable.self)!
            interactor.chuckNorrisFactsService = resolver.resolve(ChuckNorrisFactsProvidable.self)!
            interactor.presenter = resolver.resolve(HomePresentable.self)!

            return interactor
        }


        container.register(HomeViewControllable.self) { _ in HomeViewController() }
            .initCompleted { r, c in
                let child = c as! HomeViewController
                child.interactor = r.resolve(HomeInteractable.self)
            }
    }

    func resolve<T>() -> T {
        guard let resolvedType = container.resolve(T.self) else {
            preconditionFailure("Could not resolve \(T.self)")
        }
        return resolvedType
    }

    func resolve<T>(type: T.Type) -> T {
        guard let resolvedType = container.resolve(T.self) else {
            preconditionFailure("Could not resolve \(T.self)")
        }
        return resolvedType
    }
}
