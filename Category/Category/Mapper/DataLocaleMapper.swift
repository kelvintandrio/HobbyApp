//
//  DataLocaleMapper.swift
//  Category
//
//  Created by Kelvin HT on 2/20/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation

public final class DataLocaleMapper {
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
