import Foundation
import Factory

typealias AppContainer = Container
typealias Dependency = Factory
typealias ParametrizedDependency = ParameterFactory

extension AppContainer: AutoRegistering {
    public func autoRegister() {
        manager.defaultScope = .singleton
    }
}

extension AppContainer {
//    var userRepository: Dependency<UserRepository> {
//        self {
//            UserRepository()
//        }
//    }
    
    var appCoordinator: Dependency<AppCoordinator> {
        self {
            AppCoordinator(router: .init(navigationController: .init()))
        }
    }
}
