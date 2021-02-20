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

    func provideTravelLocaleRepository() -> TravelLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeTravel = TravelLocaleDataSource.sharedInstance(realm)
        return TravelLocaleRepository.sharedInstance(localeTravel)
    }

    func provideTravelDetail(category: TravelModel) -> TravelDetailProtocol {
        let repositoryTravel = provideRepository()
        let repositoryLocaleTravel = provideTravelLocaleRepository()
        return TravelDetailInteractor(repository: repositoryTravel,
                                      repositoryLocale: repositoryLocaleTravel, category: category)
    }

    func provideTravelFavorite<U: FavoriteProtocol>() -> U {
        let repositoryTravelLocale = provideTravelLocaleRepository()
        return TravelFavoriteInteractor(repository: repositoryTravelLocale) as! U
    }
    /**Travel Injection - End**/

    /**Game Injection - Start**/
    func provideGame<U: GameProtocol>() -> U {
        let remote = GameDataSource()
        let repository = GameRepository(remote: remote)
        return GameInteractor(repository: repository) as! U
    }

    func provideGameLocaleRepository() -> GameLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeGame = GameLocaleDataSource.sharedInstance(realm)
        return GameLocaleRepository.sharedInstance(localeGame)
    }

    func provideGameDetail(category: Core.GameModel) -> GameDetailProtocol {
        let repositoryGame = provideRepository()
        let repositoryLocaleGame = provideGameLocaleRepository()
        return GameDetailInteractor(repository: repositoryGame,
                                    repositoryLocale: repositoryLocaleGame, category: category)
    }

    func provideGameFavorite() -> GameFavoriteProtocol {
        let repositoryGameLocale = provideGameLocaleRepository()
        return GameFavoriteInteractor(repository: repositoryGameLocale)
    }
    /**Game Injection - End**/

    /**Movie Injection - Start**/
    func provideMovie<U: MainProtocol>() -> U {
        let remote = MovieDataSource()
        let repository = MovieRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideMovieLocaleRepository() -> MovieLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeMovie = MovieLocaleDataSource.sharedInstance(realm)
        return MovieLocaleRepository.sharedInstance(localeMovie)
    }

    func provideMovieDetail(category: MovieModel) -> MovieDetailProtocol {
        let repositoryMovie = provideRepository()
        let repositoryLocaleMovie = provideMovieLocaleRepository()
        return MovieDetailInteractor(repository: repositoryMovie,
        repositoryLocale: repositoryLocaleMovie, category: category)
    }

    func provideMovieFavorite<U: FavoriteProtocol>() -> U {
        let repositoryMovieLocale = provideMovieLocaleRepository()
        return MovieFavoriteInteractor(repository: repositoryMovieLocale) as! U
    }
    /**Movie Injection - End**/

    /**Sport Injection - Start**/
    func provideSportLocaleRepository() -> SportLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeSport = SportLocaleDataSource.sharedInstance(realm)
        return SportLocaleRepository.sharedInstance(localeSport)
    }

    func provideSport<U: MainProtocol>() -> U {
        let remote = SportDataSource()
        let repository = SportRepository(remote: remote)
        return MainInteractor(repository: repository) as! U
    }

    func provideSportDetail(category: SportModel) -> SportsDetailProtocol {
        let repositorySport = provideRepository()
        let repositoryLocaleSport = provideSportLocaleRepository()
        return SportDetailInteractor(repository: repositorySport,
                                      repositoryLocale: repositoryLocaleSport, category: category)
    }

    func provideSportFavorite<U: FavoriteProtocol>() -> U {
        let repositorySportLocale = provideSportLocaleRepository()
        return SportFavoriteInteractor(repository: repositorySportLocale) as! U
    }
    /**Sport Injection - End**/
}
