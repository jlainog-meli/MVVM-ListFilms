# # # Films
This package is a compose of different components that represent isolated features.

### ## App:

This Package represent the entire App by using the `ListFilms` and the `FilmDetail`.
It gives a single entry point to the app
```
public func buildInitialViewController() -> UIViewController
```
It manages it’s dependencies using a struct `Environment` that should be set before using the package.
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

### ## ListFilms:

This package represent the List Feature that allows you to present a list of movies.
The public interface offers you to instantiate a UI based on a given ViewModel
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

It manages it’s dependencies using a struct `Environment` that should be configured before using the package.
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

### ## FilmDetail:

This package represent the Detail Feature that allows you to present a Detail for a Movie.
The public interface offers you to instantiate a UI based on a given ViewModel
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

### ## FilmModels:

This package contains the shared models for both ListFilms and FilmDetails.
It also offers convenience mocks (only available for DEBUG) to use for testing, previews and more.

### ## Helpers:

This package contains all sort of helpers.

### ## UIComponents:

This package contains all the UI reusable Components.
It also contains the Resources needed to style the Films App like Colors, Assets and Lottie animations.

# # Structure of each Feature Package


### ## Environment

“An environment is a mutable struct that provides all the dependencies needed by objects-under-construction. This pattern is very similar to Service Locator; the only difference is an environment is accessed inside objects-under-construction, and a Service Locator is provided to the object-under-construction. This is a neat lightweight approach to managing object dependencies. To learn more, check out the Point Free Swift video series by Brandon Williams and Stephen Celis.”

Fragment from Advanced iOS App Architecture By René Cacheaux

This should hold every dependency the view model will need. 
Side effects from the environment should be feed back to the view model so the State can be mutated accordingly (can be private methods or inline blocks).

### ## ViewModel


The view model is an abstraction of the view.
It expose public (read only) Properties and Actions.

### State
A ViewModel should always represent the state for a view at anytime.
The State will be represented by the public read only properties the VM expose.
- Every mutation to the state should trigger a binding to update any listener.

### Bindings
Command-binding (or Action-Binding) are implicit in the MVVM pattern.
This bindings will represent changes in the state at any moment.

### Actions
A ViewModel expose public functions that represent all the Actions that can be trigger into the VM.
* This Actions can generate side effects.
* The side effect generated by this actions can end or not in mutations of the state.
* The use of the exposed actions are the only way to mutate the State.

### Dependencies / Side Effects
Dependencies and Side Effects will be inverted by using the `Environment` struct mentioned above.

### ## View

A View should be Dumb exposing only 2 things, how to configure it and what interactions from the user can receive.

### Setup
Generally is a helper function that takes a state and map it to the View elements.

### Actions
This are all the actions that a View can receive, such as buttons tap, gestures, keyboard inputs and more.

### ## ViewController

The ViewController is a bridge and a View it self.
As a view it should present a way to be configured and the actions it can emit such as ViewDidLoad, ViewWillAppear and any other.
As a Bridge it has some responsibilities:
* It holds a ViewModel and need to bind the state to the View (view setups)
* It need to bind the UI Actions to the ViewModel
