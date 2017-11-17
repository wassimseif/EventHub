//
//  Hub.swift
//  EventHub
//
//  Created by Wassim on 3/28/17.
//  Copyright © 2017 Wassim. All rights reserved.
//

import Foundation
import UIKit
public class Hub {
    
    public struct Observer {
        fileprivate let center: NotificationCenter
        fileprivate var observer: Any?
        
        mutating func remove() {
            if let observer = observer {
                center.removeObserver(observer)
                self.observer = nil
            }
        }
    }
    
    public init(){}
    
    fileprivate let notificationCenter = NotificationCenter()
    
    /*
     Swift does not allow us to cast `nil as! T` above without encountering an unexpected unwrap of nil,
     so this reimplementation of `observe` allows us to broadcasts events of type T?.
     */
    @discardableResult
    public func listen<T>(_ event: Event<T?>, callback: @escaping (T?) -> ()) -> Observer {
        return listen(event.name) { callback($0 as? T) }
    }
    
    @discardableResult
    public func listen<T>(_ event: Event<T>, callback: @escaping (T) -> ()) -> Observer {
        return listen(event.name) { callback($0 as! T) }
    }
    
    private  func listen(_ name: Foundation.Notification.Name, block: @escaping (Any?) -> ()) -> Observer {
        let observer = notificationCenter.addObserver(forName: name, object: nil, queue: nil) { notification in
            block(notification.object)
        }
        
        return Observer(
            center: notificationCenter,
            observer: observer
        )
    }
    
    public func notifyObservers<T>(toEvent event: Event<T>, _ object: T) {
        notificationCenter.post(name: event.name, object: object)
    }
    
    public func notifyObservers<T>(toEvent event: Event<T?>, _ object: T?) {
        notificationCenter.post(name: event.name, object: object)
    }
}

