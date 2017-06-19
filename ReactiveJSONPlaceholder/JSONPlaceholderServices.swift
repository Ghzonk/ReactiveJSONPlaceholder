//
//  JSONPlaceholderServices.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveJSON

struct JSONPlaceholderPostService : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPlaceholderPostService
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "posts" }
    
}


struct JSONPlaceholderCommentService : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPlaceholderCommentService
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "comments" }
    
}


struct JSONPlaceholderToDoService : Singleton, ServiceHost {
    
    fileprivate(set) static var shared = Instance()
    typealias Instance = JSONPlaceholderToDoService
    
    static var scheme: String { return "https" }
    static var host: String { return "jsonplaceholder.typicode.com" }
    static var path: String? { return "todos" }
    
}

