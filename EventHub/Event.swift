//
//  Event.swift
//  EventHub
//
//  Created by Wassim on 3/28/17.
//  Copyright © 2017 Wassim. All rights reserved.
//

import Foundation

public class Event<T>: EventType {
    
    fileprivate let _name: Foundation.Notification.Name
    
    var name : Foundation.Notification.Name {
        return self.name
    }
    
    public init(withName name: String) {
        self._name = Foundation.Notification.Name(name)
    }
}
