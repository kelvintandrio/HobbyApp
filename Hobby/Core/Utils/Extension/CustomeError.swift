//
//  CustomeError.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/11/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

enum URLError: LocalizedError {
    case invalidResponse
    case addressUnreachable(URL)

    var errorDescription: String? {
        switch self {
        case .invalidResponse:
            return "The server responded with garbage."
        case .addressUnreachable(let url):
            return "\(url.absoluteString) is unreachable."
        }
    }
}
enum DatabaseError: LocalizedError {
    case invalidInstance
    case requestFailed

    var errorDescription: String? {
        switch self {
        case .invalidInstance: return "Database can't instance."
        case .requestFailed: return "Your request failed."
        }
    }
}
