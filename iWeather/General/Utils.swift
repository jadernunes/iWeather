//
//  Utils.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

protocol Component {
    associatedtype Configuration

    func render(with configuration: Configuration)
}

func initElement<T: UIView>(configure: ((T) -> Void)? = nil) -> T {
    let component = T()
    component.translatesAutoresizingMaskIntoConstraints = false
    configure?(component)
    return component
}
