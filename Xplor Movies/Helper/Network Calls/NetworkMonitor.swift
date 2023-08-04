//
//  NetworkMonitor.swift
//  Xplor Movies
//
//  Created by Jiten Goswami on 04/08/23.
//

import SwiftUI
import Network

// To check internet connection availability
final class NetworkMonitor: ObservableObject {
    @Published var isConnected = false
    @Published var isCellular = false
    
    private let nwMonitor = NWPathMonitor()
    private let workerQueue = DispatchQueue.global()
    
    public func start() {
        nwMonitor.start(queue: workerQueue)
        nwMonitor.pathUpdateHandler = { [weak self] path in
            DispatchQueue.main.async {
                self?.isConnected = path.status == .satisfied
                self?.isCellular = path.usesInterfaceType(.cellular)
            }
        }
    }
    
    public func stop() {
        nwMonitor.cancel()
    }
}
