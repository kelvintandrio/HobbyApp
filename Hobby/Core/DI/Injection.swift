//
//  Injection.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/9/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation
import RealmSwift

final class Injection: NSObject {
    func provideProfile() -> ProfileProtocol {
      return ProfileInteractor()
    }

    /**Travel Injection - Start**/
    func provideTravelRepository() -> TravelRepositoryProtocol {
        let remoteTravel = TravelDataSource.sharedInstance
        return TravelRepository.sharedInstance(remoteTravel)
    }

    func provideTravelLocaleRepository() -> TravelLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeTravel = TravelLocaleDataSource.sharedInstance(realm)
        return TravelLocaleRepository.sharedInstance(localeTravel)
    }

    func provideTravel() -> TravelProtocol {
        let repositoryTravel = provideTravelRepository()
        return TravelInteractor(repository: repositoryTravel)
    }

    func provideTravelDetail(category: TravelModel) -> TravelDetailProtocol {
        let repositoryTravel = provideTravelRepository()
        let repositoryLocaleTravel = provideTravelLocaleRepository()
        return TravelDetailInteractor(repository: repositoryTravel,
                                      repositoryLocale: repositoryLocaleTravel, category: category)
    }

    func provideTravelFavorite() -> TravelFavoriteProtocol {
        let repositoryTravelLocale = provideTravelLocaleRepository()
        return TravelFavoriteInteractor(repository: repositoryTravelLocale)
    }
    /**Travel Injection - End**/

    /**Game Injection - Start**/
    func provideGameRepository() -> GameRepositoryProtocol {
        let remoteGame = GameDataSource.sharedInstance
        return GameRepository.sharedInstance(remoteGame)
    }

    func provideGameLocaleRepository() -> GameLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeGame = GameLocaleDataSource.sharedInstance(realm)
        return GameLocaleRepository.sharedInstance(localeGame)
    }

    func provideGame() -> GameProtocol {
        let repositoryGame = provideGameRepository()
        return GameInteractor(repository: repositoryGame)
    }

    func provideGameDetail(category: GameModel) -> GameDetailProtocol {
        let repositoryGame = provideGameRepository()
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
    func provideMovieRepository() -> MovieRepositoryProtocol {
        let remoteMovie = MovieDataSource.sharedInstance
        return MovieRepository.sharedInstance(remoteMovie)
    }

    func provideMovieLocaleRepository() -> MovieLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeMovie = MovieLocaleDataSource.sharedInstance(realm)
        return MovieLocaleRepository.sharedInstance(localeMovie)
    }

    func provideMovie() -> MovieProtocol {
        let repositoryMovie = provideMovieRepository()
        return MovieInteractor(repository: repositoryMovie)
    }

    func provideMovieDetail(category: MovieModel) -> MovieDetailProtocol {
        let repositoryMovie = provideMovieRepository()
        let repositoryLocaleMovie = provideMovieLocaleRepository()
        return MovieDetailInteractor(repository: repositoryMovie,
        repositoryLocale: repositoryLocaleMovie, category: category)
    }

    func provideMovieFavorite() -> MovieFavoriteProtocol {
        let repositoryMovieLocale = provideMovieLocaleRepository()
        return MovieFavoriteInteractor(repository: repositoryMovieLocale)
    }
    /**Movie Injection - End**/

    /**Sport Injection - Start**/
    func provideSportLocaleRepository() -> SportLocaleRepositoryProtocol {
        let realm = try? Realm()
        let localeSport = SportLocaleDataSource.sharedInstance(realm)
        return SportLocaleRepository.sharedInstance(localeSport)
    }

    func provideSportRepository() -> SportRepositoryProtocol {
        let remoteSport = SportDataSource.sharedInstance
        return SportRepository.sharedInstance(remoteSport)
    }

    func provideSport() -> SportsProtocol {
        let repositorySport = provideSportRepository()
        return SportsInteractor(repository: repositorySport)
    }

    func provideSportDetail(category: SportModel) -> SportsDetailProtocol {
        let repositorySport = provideSportRepository()
        let repositoryLocaleSport = provideSportLocaleRepository()
        return SportDetailInteractor(repository: repositorySport,
                                      repositoryLocale: repositoryLocaleSport, category: category)
    }

    func provideSportFavorite() -> SportFavoriteProtocol {
        let repositorySportLocale = provideSportLocaleRepository()
        return SportFavoriteInteractor(repository: repositorySportLocale)
    }
    /**Sport Injection - End**/
}
