//
//  DataLocaleMapper.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 1/15/21.
//  Copyright © 2021 Kelvin HT. All rights reserved.
//

import Foundation
import Core

final class DataLocaleMapper02 {
    static func mapTravelToModel(input travelResponses: [TravelEntity]) -> [TravelModel] {
        return travelResponses.map { result in
            return TravelModel(
                id: result.id,
                name: result.name,
                image: result.image,
                latitude: result.latitude,
                longitude: result.longitude,
                descript: result.descript,
                address: result.address,
                like: result.like
            )
        }
    }
    static func mapTravelToEntity(input travelModel: TravelModel) -> TravelEntity {
        let travelEntity = TravelEntity()
        travelEntity.id = travelModel.id
        travelEntity.name = travelModel.name
        travelEntity.image = travelModel.image
        travelEntity.latitude = travelModel.latitude
        travelEntity.longitude = travelModel.longitude
        travelEntity.descript = travelModel.descript
        travelEntity.address = travelModel.address
        travelEntity.like = travelModel.like
        return travelEntity
    }

    static func mapSportToModel(input sportResponses: [SportEntity]) -> [SportModel] {
        return sportResponses.map { result in
            return SportModel(
                id: result.id,
                name: result.name,
                image: result.image,
                descript: result.descript
            )
        }
    }
    static func mapSportToEntity(input sportModel: SportModel) -> SportEntity {
        let sportEntity = SportEntity()
        sportEntity.id = sportModel.id
        sportEntity.name = sportModel.name
        sportEntity.image = sportModel.image
        sportEntity.descript = sportModel.descript
        return sportEntity
    }
}
