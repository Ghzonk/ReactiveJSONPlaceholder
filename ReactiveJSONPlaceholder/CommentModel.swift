//
//  CommentModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveJSON


class CommentModel {
    
    var id: Int
    var postId: Int
    var name: String
    var email: String
    var body: String
    
    init? (withEntity e:Entity<Int>) {
        guard let id = e.id
            , let postId = e.attributes?.json["postId"] as? Int
            , let name = e.attributes?.json["name"] as? String
            , let email = e.attributes?.json["email"] as? String
            , let body = e.attributes?.json["body"] as? String
            else {
                return nil
        }
        
        self.id = id
        self.postId = postId
        self.name = name
        self.email = email
        self.body = body
    }
    
}
