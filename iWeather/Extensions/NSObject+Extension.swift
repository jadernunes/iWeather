//
//  NSObject+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import Foundation

protocol ClassNameProtocol {
    static var className: String { get }
    var className: String { get }
}

extension ClassNameProtocol {

    static var className: String {
        String(describing: self)
    }

    var className: String {
        type(of: self).className
    }
}

extension NSObject: ClassNameProtocol {}
