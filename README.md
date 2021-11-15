# iWeather

## Description
This project will show a list of weathers on the search screen based on user's location and they can add it as favorite to see in the future.

## Topics
* [Architecture](#architecture)
* [Concepts covered](#concepts_covered)
* [In this version](#in_this_version)
* [Future items](#future_items)
* [Dependencies](#dependencies)
* [Requirements](#requirements)
* [Installation](#installation)

## Architecture
For this application was used **MVVM-C** where C is Coordinator to manage all the presentations for each flow.
Using this pattern also allow us to manage all the business logic inside the ViewModels, given a good point when we're looking at an application with Scalability, Readability and Maintainability.
Following the same concept we created a components that could be used everywhere inside.

## Concepts covered
* SOLID.
* Inheritance.
* Encapsulation.
* Maintainability.
* Scalability.
* Readability.
* Testability.
* Components.

### In this version

#### Screens
* Favorite screen: load, add and remove weather.
* Search screen: show a list of weather based on user's location.
* Detail screen: show weather detail info.
* Spalsh screen.

#### Components
* Error
* No data
* Loading
* Weather cell
* Weather list

#### Other things
* App icon.
* Unit tests.
* Internationalization(English only).
* TODO search: *every build the project will show a warnning on each TODO tag we keeped.*
* Database using UserDefaults. As the data isn't sensitive we choosed this one but if we would save an user data, keychain should be used.

## Future items
* Add .frameworks: *Create custom frameworks  to allow to grow scalable in a different teams*
* UI tests, tesing screens and the elements in itself.
* Handle erros with a custom alert component.
* Support both Dark and Light mode.
* Add Crashlytics framework to traking all issues.
* Create helper functions to work around constraint avoiding boilerplates.
* Search locations by name.
* Show a list of days of each city.

## Dependencies
* [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) 1.10.2.
* [R.swift](https://github.com/mac-cain13/R.swift) (5.4.0): It makes the code that uses resources:
* **Fully typed**, less casting and guessing what a method will return.
* **Compile time checked**, no more incorrect strings that make the app crash at runtime.
* **Autocompleted**, help us to don't guess that image name again.
* [Alamofire](https://github.com/Alamofire/Alamofire) (5.4.x): *We choose it because a bunch of developers are working around this every day and following that is easiest to find a issue if it's come up. On this library they've frequency of updates, solve bugs very fast. But for sure there's no a silver bullet, if we already have in our compay a network library used for long time it also could be a good choise.*

## Requirements
* iOS 13.0+.
* Xcode 12.x.
* Swift 5.0.

## Installation
* Make sure we've been installed [Cocoapods](https://guides.cocoapods.org/using/getting-started.html) 1.10.2.
* Open the *Terminal*.
* Go to the project's root folder where should've the **Podfile**.
* Run this command: ```pod install```.


## Screenshots
------------

### iPhone

| Splashscreen  | Favorite empty |
| ------------- | ------------- |
| ![iPhone1](/screenshots/iphone/img1.png?raw=true) | ![iPhone2](/screenshots/iphone/img2.png?raw=true) |


| Search  | Detail |
| ------------- | ------------- | 
| ![iPhone3](/screenshots/iphone/img3.png?raw=true) | ![iPhone4](/screenshots/iphone/img4.png?raw=true) |


| Favorites  | Deliting Favorite |
| ------------- | ------------- |
| ![iPhone5](/screenshots/iphone/img5.png?raw=true) | ![iPhone6](/screenshots/iphone/img6.png?raw=true) |


| Video  |
| ------------- |
| ![iPhone7](/screenshots/iphone/movie.gif?raw=true) |



### iPad

| Splashscreen  | Favorite empty |
| ------------- | ------------- |
| ![iPad1](/screenshots/ipad/img1.png?raw=true) | ![iPad2](/screenshots/ipad/img2.png?raw=true) |


| Search  | Detail |
| ------------- | ------------- | 
| ![iPhone3](/screenshots/ipad/img3.png?raw=true) | ![iPad4](/screenshots/ipad/img4.png?raw=true) |


| Favorites  | Deliting Favorite |
| ------------- | ------------- |
| ![iPad5](/screenshots/ipad/img5.png?raw=true) | ![iPad6](/screenshots/ipad/img6.png?raw=true) |


| Video  |
| ------------- |
| ![iPad7](/screenshots/ipad/movie.gif?raw=true) |
