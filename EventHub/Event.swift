//
//  Event.swift
//  EventHub
//
//  Created by Wassim on 3/28/17.
//  Copyright © 2017 Wassim. All rights reserved.
//

import Foundation
public class Event<T>: Events {
    fileprivate let name: Foundation.Notification.Name
    
    func getName() -> Foundation.Notification.Name {
        return self.name
    }
    public init(_ name: String) {
        self.name = Foundation.Notification.Name(name)
    }
}
