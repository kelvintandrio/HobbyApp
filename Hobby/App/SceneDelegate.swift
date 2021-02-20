//
//  SceneDelegate.swift
//  capStoneApps
//
//  Created by Kelvin HT on 11/3/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import UIKit
import SwiftUI
import Category
import Core

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        let movieUsecase: MainInteractor<[MovieModel], MovieRepository> = Injection.init().provideMovie()
        let travelUseCase: TravelInteractor<TravelRepository> = Injection.init().provideTravel()
        let sportUseCase: MainInteractor<[SportModel], SportRepository> = Injection.init().provideSport()
        let gameUseCase: GameInteractor<GameRepository> = Injection.init().provideGame()

        let profileUseCase = Injection.init().provideProfile()

        let gameFavoriteUseCase = Injection.init().provideGameFavorite()
        let movieFavoriteUseCase: MovieFavoriteInteractor = Injection.init().provideMovieFavorite()
        let travelFavoriteUseCase = Injection.init().provideTravelFavorite()
        let sportFavoriteUseCase: SportFavoriteInteractor = Injection.init().provideSportFavorite()

        let profilePresenter = ProfilePresenter(profileProtocol: profileUseCase)
        let gamePresenter = GamePresenter(gameUseCase: gameUseCase)
        let moviePresenter = MoviePresenter(movieUseCase: movieUsecase)
        let travelPresenter = TravelPresenter(travelUseCase: travelUseCase)
        let sportPresenter = SportsPresenter(sportUseCase: sportUseCase)

        let gameFavoritePresenter = GameFavoritePresenter(gameFavoriteUseCase: gameFavoriteUseCase)
        let movieFavoritePresenter = MovieFavoritePresenter(movieFavoriteUseCase: movieFavoriteUseCase)
        let travelFavoritePresenter = TravelFavoritePresenter(travelFavoriteUseCase: travelFavoriteUseCase)
        let sportFavoritePresenter = SportFavoritePresenter(sportFavoriteUseCase: sportFavoriteUseCase)

        let contentView = ContentView()
            .environmentObject(travelPresenter)
            .environmentObject(travelFavoritePresenter)
            .environmentObject(profilePresenter)
            .environmentObject(gamePresenter)
            .environmentObject(gameFavoritePresenter)
            .environmentObject(moviePresenter)
            .environmentObject(movieFavoritePresenter)
            .environmentObject(sportPresenter)
            .environmentObject(sportFavoritePresenter)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
}
