//
//  InfoWeatherComponent.swift
//  iWeather
//
//  Created by Jader Nunes on 14/11/21.
//

import UIKit

final class InfoWeatherComponent: UIView {

    // MARK: - Attributes

    private weak var viewModel: InfoWeatherViewModelProtocol?

    // MARK: - Elements

    private let cityLabel: UILabel = initElement {
        $0.font = .title
        $0.textColor = .clBlack
        $0.textAlignment = .left
    }
    private let dateLabel: UILabel = initElement {
        $0.font = .subTitle
        $0.textColor = .clBlack
        $0.textAlignment = .center
    }
    private let imageView: UIImageView = initElement {
        $0.contentMode = .scaleAspectFit
    }
    private let currentTempLabel: UILabel = initElement {
        $0.font = .header
        $0.textColor = .clBlack
        $0.textAlignment = .left
    }
    private let weatherTypeLabel: UILabel = initElement {
        $0.font = .subDetail
        $0.textColor = .clGray
        $0.textAlignment = .center
    }
    private let minTempLabel: UILabel = initElement {
        $0.font = .detail
        $0.textColor = .clBlack
        $0.textAlignment = .right
    }
    private let maxTempLabel: UILabel = initElement {
        $0.font = .detail
        $0.textColor = .clBlack
        $0.textAlignment = .left
    }

    // MARK: - Life cycle

    init() {
        super.init(frame: .zero)

        defineSubviews()
        defineSubviewsConstraints()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Custom methods

    private func populdateUI() {
        cityLabel.text = viewModel?.cityName
        dateLabel.text = viewModel?.dateToday
        imageView.addImage(path: viewModel?.weatherIconPath ?? "")
        currentTempLabel.text = viewModel?.currentTemp
        weatherTypeLabel.text = viewModel?.weatherTypeName
        minTempLabel.text = viewModel?.minTemp
        maxTempLabel.text = viewModel?.maxTemp
    }

    private func defineSubviews() {
        backgroundColor = .clSecondary
        addSubview(cityLabel)
        addSubview(dateLabel)
        addSubview(imageView)
        addSubview(currentTempLabel)
        addSubview(weatherTypeLabel)
        addSubview(minTempLabel)
        addSubview(maxTempLabel)
    }
}

// MARK: - Component

extension InfoWeatherComponent: Component {

    enum InfoWeatherState {
        case content(viewModel: InfoWeatherViewModelProtocol)
    }

    func render(with configuration: InfoWeatherState) {
        switch configuration {
            case .content(let viewModel):
                self.viewModel = viewModel
                populdateUI()
        }
    }
}

// MARK: - Constraints

extension InfoWeatherComponent {

    private func defineSubviewsConstraints() {
        setupCityLabelConstraints()
        setupDataLabelConstraints()
        setupImageConstraints()
        setupCurrentTempConstraints()
        setupWeatherTypeConstraints()
        setupMinTemConstraints()
        setupMaxTemConstraints()
    }

    private func setupCityLabelConstraints() {
        NSLayoutConstraint.activate([
            cityLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            cityLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            cityLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: 16),
        ])
    }

    private func setupDataLabelConstraints() {
        NSLayoutConstraint.activate([
            dateLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 24),
            dateLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            dateLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
        ])
    }

    private func setupImageConstraints() {
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 24),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 40),
            imageView.widthAnchor.constraint(equalToConstant: 40)
        ])
    }

    private func setupCurrentTempConstraints() {
        NSLayoutConstraint.activate([
            currentTempLabel.topAnchor.constraint(equalTo: dateLabel.bottomAnchor, constant: 4),
            currentTempLabel.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8),
            currentTempLabel.heightAnchor.constraint(equalToConstant: 64),
            currentTempLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }

    private func setupWeatherTypeConstraints() {
        NSLayoutConstraint.activate([
            weatherTypeLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 16),
            weatherTypeLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            weatherTypeLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }

    private func setupMinTemConstraints() {
        NSLayoutConstraint.activate([
            minTempLabel.topAnchor.constraint(equalTo: weatherTypeLabel.bottomAnchor, constant: 8),
            minTempLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            minTempLabel.widthAnchor.constraint(equalTo: maxTempLabel.widthAnchor)
        ])
    }

    private func setupMaxTemConstraints() {
        NSLayoutConstraint.activate([
            maxTempLabel.topAnchor.constraint(equalTo: weatherTypeLabel.bottomAnchor, constant: 8),
            maxTempLabel.leftAnchor.constraint(equalTo: minTempLabel.rightAnchor, constant: 8),
            maxTempLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -16)
        ])
    }
}
