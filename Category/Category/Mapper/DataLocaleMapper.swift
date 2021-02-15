//
//  DataLocaleMapper.swift
//  Category
//
//  Created by Kelvin HT on 2/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core

public final class DataLocaleMapper {
    public static func mapGameToModel(input gameResponses: [GameEntity]) -> [Core.GameModel] {
        return gameResponses.map { result in
            return Core.GameModel(
                id: result.id,
                name: result.name,
                image: result.image,
                released: result.released,
                rating: result.rating,
                description: result.description
            )
        }
    }
    public static func mapGameToEntity(input gameModel: Core.GameModel) -> GameEntity {
        let gameEntity = GameEntity()
        gameEntity.id = gameModel.id
        gameEntity.name = gameModel.name
        gameEntity.image = gameModel.image
        gameEntity.released = gameModel.released
        gameEntity.rating = gameModel.rating
        return gameEntity
    }
    public static func mapMovieToModel(input movieResponses: [MovieEntity]) -> [MovieModel] {
        return movieResponses.map { result in
            return MovieModel(
                id: result.id,
                name: result.name,
                image: result.image,
                released: result.released,
                rating: result.rating,
                description: result.description)
        }
    }
    public static func mapMovieToEntity(input movieModel: MovieModel) -> MovieEntity {
        let movieEntity = MovieEntity()
        movieEntity.id = movieModel.id
        movieEntity.name = movieModel.name
        movieEntity.image = movieModel.image
        movieEntity.descript = movieModel.descript
        movieEntity.released = movieModel.released
        movieEntity.rating = movieModel.rating
        return movieEntity
    }
//
//    public static func mapTravelToModel(input travelResponses: [TravelEntity]) -> [TravelModel] {
//        return travelResponses.map { result in
//            return TravelModel(
//                id: result.id,
//                name: result.name,
//                image: result.image,
//                latitude: result.latitude,
//                longitude: result.longitude,
//                descript: result.descript,
//                address: result.address,
//                like: result.like
//            )
//        }
//    }
//    public static func mapTravelToEntity(input travelModel: TravelModel) -> TravelEntity {
//        let travelEntity = TravelEntity()
//        travelEntity.id = travelModel.id
//        travelEntity.name = travelModel.name
//        travelEntity.image = travelModel.image
//        travelEntity.latitude = travelModel.latitude
//        travelEntity.longitude = travelModel.longitude
//        travelEntity.descript = travelModel.descript
//        travelEntity.address = travelModel.address
//        travelEntity.like = travelModel.like
//        return travelEntity
//    }
//
    public static func mapSportToModel(input sportResponses: [SportEntity]) -> [SportModel] {
        return sportResponses.map { result in
            return SportModel(
                id: result.id,
                name: result.name,
                image: result.image,
                description: result.descript
            )
        }
    }
    public static func mapSportToEntity(input sportModel: SportModel) -> SportEntity {
        let sportEntity = SportEntity()
        sportEntity.id = sportModel.id
        sportEntity.name = sportModel.name
        sportEntity.image = sportModel.image
        sportEntity.descript = sportModel.descript
        return sportEntity
    }
}
