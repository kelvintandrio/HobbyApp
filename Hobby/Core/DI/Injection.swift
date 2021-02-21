//
//  Injection.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/9/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift
import Category
import Core
import Common
import UIKit

public final class Injection: NSObject {
    func provideProfile() -> ProfileProtocol {
      return ProfileInteractor()
    }

    /**Injection General**/
    private func provideRepository() -> HobbyRepositoryProtocol {
        let remote: RemoteDataSource = RemoteDataSource.sharedInstance
        return HobbyRepository.sharedInstance(remote)
    }

    /**Travel Injection - Start**/
    func provideTravel<U: MainProtocol>() -> U {
        let remote = TravelDataSource()
        let repository = TravelRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideTravelDetail<U: DetailProtocol>(category: TravelModel) -> U {
        let repositoryTravel = provideRepository()
        let realm = try? Realm()
        let locale = TravelLocaleDataSource(realm: realm)
        let repositoryLocaleTravel = TravelLocaleRepository(locale: locale)
        return DetailInteractor(repository: repositoryTravel,
                                      repositoryLocale: repositoryLocaleTravel) as! U
    }

    func provideTravelFavorite<U: FavoriteProtocol>() -> U {
        let realm = try? Realm()
        let locale = TravelLocaleDataSource(realm: realm)
        let repositoryTravelLocale = TravelLocaleRepository(locale: locale)
        return FavoriteInteractor(repository: repositoryTravelLocale) as! U
    }
    /**Travel Injection - End**/

    /**Game Injection - Start**/
    func provideGame<U: MainProtocol>() -> U {
        let remote = GameDataSource()
        let repository = GameRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideGameLocaleRepository() -> GameLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeGame = GameLocaleDataSource.sharedInstance(realm)
        return GameLocaleRepository.sharedInstance(localeGame)
    }

    func provideGameDetail(category: GameModel) -> GameDetailProtocol {
        let repositoryGame = provideRepository()
        let repositoryLocaleGame = provideGameLocaleRepository()
        return GameDetailInteractor(repository: repositoryGame,
                                    repositoryLocale: repositoryLocaleGame, category: category)
    }

    func provideGameFavorite<U: FavoriteProtocol>() -> U {
        let repositoryGameLocale = provideGameLocaleRepository()
        return GameFavoriteInteractor(repository: repositoryGameLocale) as! U
    }
    /**Game Injection - End**/

    /**Movie Injection - Start**/
    func provideMovie<U: MainProtocol>() -> U {
        let remote = MovieDataSource()
        let repository = MovieRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideMovieDetail<U: DetailProtocol>(category: MovieModel) -> U {
        let repositoryMovie = provideRepository()
        let realm = try? Realm()
        let locale = MovieLocaleDataSource(realm: realm)
        let repositoryLocaleMovie = MovieLocaleRepository(locale: locale)
        return DetailInteractor(repository: repositoryMovie,
        repositoryLocale: repositoryLocaleMovie) as! U
    }

    func provideMovieFavorite<U: FavoriteProtocol>() -> U {
        let realm = try? Realm()
        let locale = MovieLocaleDataSource(realm: realm)
        let repository = MovieLocaleRepository(locale: locale)
        return FavoriteInteractor(repository: repository) as! U
    }
    /**Movie Injection - End**/

    /**Sport Injection - Start**/
    func provideSport<U: MainProtocol>() -> U {
        let remote = SportDataSource()
        let repository = SportRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideSportDetail<U: DetailProtocol>(category: SportModel) -> U {
        let repositorySport = provideRepository()
        let realm = try? Realm()
        let locale = SportLocaleDataSource(realm: realm)
        let repositoryLocaleSport = SportLocaleRepository(locale: locale)
        return DetailInteractor(repository: repositorySport,
                                      repositoryLocale: repositoryLocaleSport) as! U
    }

    func provideSportFavorite<U: FavoriteProtocol>() -> U {
        let realm = try? Realm()
        let locale = SportLocaleDataSource(realm: realm)
        let repositorySportLocale = SportLocaleRepository(locale: locale)
        return FavoriteInteractor(repository: repositorySportLocale) as! U
    }
    /**Sport Injection - End**/
}
