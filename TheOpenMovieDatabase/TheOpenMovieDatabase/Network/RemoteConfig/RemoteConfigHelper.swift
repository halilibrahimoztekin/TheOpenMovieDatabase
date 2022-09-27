//
//  RemoteConfigHelper.swift
//  TheOpenMovieDatabase
//
//  Created by bukefalosWorkMac on 27.09.2022.
//

import Foundation

import FirebaseRemoteConfig


class RemoteConfigHelper {
    static let shared = RemoteConfigHelper()

    func fetchRemoteConfig() {
        remoteConfig.fetch(withExpirationDuration: 0) { [weak self] status, error in
            guard error == nil else { return }
            remoteConfig.activate()
        }
    }

    func displayNewValues(completion: @escaping (String)->()){
        let logoText = remoteConfig.configValue(forKey: "LogoText").stringValue ?? ""
        completion(logoText)
    }
}
