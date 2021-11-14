//
//  UIView+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

func initElement<T: UIView>(configure: ((T) -> Void)? = nil) -> T {
    let component = T()
    component.translatesAutoresizingMaskIntoConstraints = false
    configure?(component)
    return component
}

// MARK: - Constraints

extension UIView {

    @discardableResult func centerInSuperview() -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return self }

        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])

        return self
    }
}

// MARK: - General

extension UIView {

    /// Used to work arout the activity indicator to show when the view is loading
    var tagLoader: Int { 9999 }

    func startLoader(style: UIActivityIndicatorView.Style = .medium) {
        let loader = UIActivityIndicatorView()
        loader.hidesWhenStopped = true
        loader.style = style
        loader.tag = tagLoader

        addSubview(loader)
        loader.startAnimating()
        loader.centerInSuperview()
    }

    func stopLoader() {
        viewWithTag(tagLoader)?.removeFromSuperview()
    }
}
