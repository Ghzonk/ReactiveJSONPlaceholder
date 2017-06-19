//
//  DetailModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
class DetailViewModel {
    
    var title: String
    var text: String
    
    init?(withPost p:PostCellViewModel?) {
        guard let title = p?.title
            , let body = p?.body
            else {
                return nil
        }
        
        self.title = "Post Details"
        self.text = "Title:\n\(title)\n\nBody:\n\(body)"
    }

    
    init?(withComment c:CommentCellViewModel?) {
        guard let name = c?.name
            , let email = c?.email
            , let body = c?.body
            else {
                return nil
        }
        
        self.title = "Comment Details"
        self.text = "Name:\n\(name)\n\nEmail:\n\(email)\n\nBody:\n\(body)"
    }

    
    init?(withToDo td:ToDoCellViewModel?) {
        guard let title = td?.title
            , let completed = td?.completed
            else {
                return nil
        }
        
        self.title = "To Do Item Details"
        self.text = "Title:\n\(title)\n\nIs Completed:\n\(completed)"
    }

}
