//
//  UserDefaultsMock.swift
//  iWeatherTests
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

final class UserDefaultsMock: UserDefaults {

    override class var standard: UserDefaults { UserDefaultsMock(suiteName: "tests") ?? UserDefaultsMock() }

    override class func resetStandardUserDefaults() {
        standard.dictionaryRepresentation().keys.forEach {
            standard.removeObject(forKey: $0)
        }
    }
}
