//
//  ProfilePresenter.swift
//  CapStoneApps
//
//  Created by Kelvin HT on 12/9/20.
//  Copyright © 2020 Kelvin HT. All rights reserved.
//

import Foundation

class ProfilePresenter: ObservableObject {
    private let profileProtocol: ProfileProtocol

    @Published var profile: Profile = Profile()

    init(profileProtocol: ProfileProtocol) {
        self.profileProtocol = profileProtocol
    }

    func getProfile() {
        self.profile = profileProtocol.getProfile()
    }
}
