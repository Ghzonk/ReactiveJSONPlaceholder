//
//  PostModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveJSON


class PostModel {
    
    var id: Int
    var userId: Int
    var title: String
    var body: String
    
    init?(withEntity e:Entity<Int>) {
        guard let id = e.id
            , let userId = e.attributes?.json["userId"] as? Int
            , let title = e.attributes?.json["title"] as? String
            , let body = e.attributes?.json["body"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.userId = userId
        self.title = title
        self.body = body
    }
    
}

