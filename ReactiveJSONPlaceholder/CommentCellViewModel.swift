//
//  CommentCellViewModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveJSON

class CommentCellViewModel {
    let name: String
    let email: String
    let body: String
    
    init?(withEntity e:Entity<Int>) {
        guard let name = e.attributes?.json["name"] as? String
            , let email = e.attributes?.json["email"] as? String
            , let body = e.attributes?.json["body"] as? String
        else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.body = body
    }
    
    init?(withCommentModel c:CommentModel?) {
        guard let name = c?.name
            , let email = c?.email
            , let body = c?.body
        else {
            return nil
        }
        
        self.name = name
        self.email = email
        self.body = body
    }
    
}

