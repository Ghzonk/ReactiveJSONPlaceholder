//
//  ToDoCellViewModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveJSON

class ToDoCellViewModel {
    let title: String
    let completed: Bool
    
    init?(withEntity e:Entity<Int>) {
        guard let title = e.attributes?.json["title"] as? String
            , let completed = e.attributes?.json["completed"] as? Bool
            else {
                return nil
        }
        
        self.title = title
        self.completed = completed
    }
    
    init?(withToDoModel p:ToDoModel?) {
        guard let title = p?.title
            , let completed = p?.completed
            else {
                return nil
        }
        
        self.title = title
        self.completed = completed
    }
    
}

