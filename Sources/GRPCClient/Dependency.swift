import NIOHPACK
import GRPC

public protocol Dependency {
    /// It is possible to monitor all requests by injecting it when creating `Session`.
    /// Processing can be interrupted as necessary.
    ///
    /// - Parameter headers: HPACKHeaders to be sent
    /// - Returns: Metadata changed as necessary
    /// - Throws: Error when intercepting request
    func intercept(headers: HPACKHeaders) throws -> HPACKHeaders

    /// Called when the client catches an error.
    ///
    /// - Parameters:
    ///   - error: The error which was caught.
    ///   - file: The file where the error was raised.
    ///   - line: The line within the file where the error was raised.
    func didCatchError(_ error: Error, file: StaticString, line: Int)

    /// Called when connectivity state changed.
    ///
    /// - Parameters:
    ///   - oldState: old connectivity state.
    ///   - newState: new connectivity state.
    func didConnectivityStateDidChange(oldState: ConnectivityState, newState: ConnectivityState)

    /// Called when connection started quiescing.
    func didConnectionStartedQuiescing()
}

public extension Dependency {
    func intercept(headers: HPACKHeaders) throws -> HPACKHeaders {
        headers
    }

    func didCatchError(_ error: Error, file: StaticString, line: Int) {}

    func didConnectivityStateDidChange(oldState: ConnectivityState, newState: ConnectivityState) {}

    func didConnectionStartedQuiescing() {}
}

public class StreamingDependency: Dependency {
    public init() {}
}
