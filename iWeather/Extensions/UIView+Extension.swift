//
//  UIView+Extension.swift
//  iWeather
//
//  Created by Jader Nunes on 13/11/21.
//

import UIKit

// MARK: - Constraints

extension UIView {

    func centerInSuperview() -> UIView {
        translatesAutoresizingMaskIntoConstraints = false
        guard let superview = superview else { return self }

        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])

        return self
    }

    func anchor(_ view: UIView, distance: CGFloat = 8) {
        NSLayoutConstraint.activate([
            leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: distance),
            rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -distance),
            topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: distance),
            bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -distance),
        ])
    }
}

// MARK: - General

extension UIView {

    /// Used to work arout the activity indicator to show when the view is loading
    var tagLoader: Int { 9999 }

    var isVisible: Bool {
        set {
            self.isHidden = !newValue
        }
        get {
            return !self.isHidden
        }
    }

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
