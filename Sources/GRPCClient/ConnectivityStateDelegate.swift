import enum GRPC.ConnectivityState
import protocol GRPC.ConnectivityStateDelegate

final class ConnectivityStateDelegate: GRPC.ConnectivityStateDelegate {
    typealias StateChangedHandler = (ConnectivityState, ConnectivityState) -> Void
    typealias QuiescingHandler = () -> Void

    let stateChangedHandler: StateChangedHandler
    let quiescingHandler: QuiescingHandler

    init(stateChangedHandler: @escaping StateChangedHandler, quiescingHandler: @escaping QuiescingHandler) {
        self.stateChangedHandler = stateChangedHandler
        self.quiescingHandler = quiescingHandler
    }

    func connectivityStateDidChange(from oldState: ConnectivityState, to newState: ConnectivityState) {
        stateChangedHandler(oldState, newState)
    }

    func connectionStartedQuiescing() {
        quiescingHandler()
    }
}
