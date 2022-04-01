# Films

This package is a compose of diferent components that represent isolated features.

## App:
This Package represent the entire App by using the `ListFilms` and the `FilmDetail`.
It gives a single entry point to the app
```
public func buildInitialViewController() -> UIViewController
```
It manages its dependencies using a struct `Environment` that should be set before using the package.
You can configure it by calling `App.setEnvironment` and in result it will also configure the environment of its enclosure dependencies.
```swift
public func setEnvironment(_ env: Environment) {
    environment = env
    ListFilms.setEnvironment(env.listFilms)
    FilmDetail.setEnvironment(env.filmsDetail)
}
public struct Environment {
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        getTopRatedMovies: @escaping (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void,
        genre: @escaping (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    )
}
extension Environment {
    internal var listFilms: ListFilms.Environment { get }
    internal var filmsDetail: FilmDetail.Environment { get }
}
```

## ListFilms:
This package represent the List Feature that allows you to present a list of movies.
The public interface offers you to instanciate a UI based on a given ViewModel
```swift
public final class ListViewController : UIViewController {
    public init(viewModel: ListViewModel)
}

public enum ListState : Equatable {
    case hasData(data: MoviesList)
    case hasError(message: String)
    case isLoading(isLoading: Bool)
    case idle
}

public enum ListRoute {
    case detail(Movie)
}

public final class ListViewModel {
    public init(state: ListState = .idle, route: ListRoute? = nil)
}
```
This package also allows you to navigate to a movie detail. 
You can see the states of the View in `ListState` and the routes it can navigate to in `ListRoute`

It manages its dependencies using a struct `Environment` that should be configured before using the package.
You can do this by calling `ListFilms.setEnvironment`
```swift
public func setEnvironment(_ env: Environment)

public struct Environment {
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main,
        getTopRatedMovies: @escaping (_ completion: @escaping (Result<MoviesList, MovieError>) -> Void) -> Void
    )

    public var buildMovieDetail: ((Movie) -> UIViewController)?
}
```

## FilmDetail:
This package represent the Detail Feature that allows you to present a Detail for a Movie.
The public interface offers you to instanciate a UI based on a given ViewModel
```swift
public final class DetailViewModel {
    public init(movie: Movie, genres: [Genre] = [])
}

public final class DetailViewController : UIViewController {
    public init(viewModel: DetailViewModel)
}
```
It manages its dependencies using a struct `Environment` that should be configured before using the package by calling `FilmDetails.setEnvironment()` 
```Swift
public func setEnvironment(_ env: Environment)

public struct Environment {
    public init(
        mainQueue: AnySchedulerOf<DispatchQueue> = .main, 
        genre: @escaping (_ genreIds: [Int], _ callback: @escaping (Result<[Genre], MovieError>) -> Void) -> Void
    )
}
```

## FilmModels:
This package contains the shared models for both ListFilms and FilmDetails.
It also offers convenience mocks (only available for DEBUG) to use for testing, previews and more.

## Helpers:
This package contains all sort of helpers.

## UIComponents:
This package contains all the UI reusable Components.
It also contains the Resources needed to style the Films App like Colors, Assets and Lottie animations.

# Structure of each Feature Package
