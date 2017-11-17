//
//  Event.swift
//  EventHub
//
//  Created by Wassim on 3/28/17.
//  Copyright © 2017 Wassim. All rights reserved.
//

import Foundation

public class Event<T>: EventType {
    
     let name: Foundation.Notification.Name
    
  
    public init(withName name: String) {
        self.name = Foundation.Notification.Name(name)
    }
}
