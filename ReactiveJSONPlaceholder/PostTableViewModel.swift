//
//  PostTableViewModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import ReactiveJSON


class PostTableViewModel {
    
    
    var receivedData:[AnyObject] = []
    
    var isReloaded: MutableProperty<Bool>
    
    private var reloadDataPipe: (Signal<(), NoError>, Observer<(), NoError>)
    
    
    var signalReload: Signal<(), NoError> {
        return reloadDataPipe.0
    }
    
    
    
    init() {
        isReloaded = MutableProperty<Bool>(true)
        reloadDataPipe = Signal<(), NoError>.pipe()
    }
    
    
    
    func getPostCellViewModel(atIndex index: Int) -> PostCellViewModel? {
        if !receivedData.indices.contains(index) {
            return nil
        }
        
        let data = receivedData[index]
        let e:Entity<Int> = Entity<Int>(data as! [String:AnyObject])
        guard let post: PostModel = PostModel(withEntity: e) else {
            return nil
        }
        return PostCellViewModel(withPostModel: post)
        
        // return PostCellViewModel(withEntity: Entity<Int>(receivedData[index] as! [String:AnyObject]))
    }
    
    
    func request() {
        
        let signalProducer:SignalProducer<Array<AnyObject>, NetworkError> = JSONPlaceholderPostService.request(endpoint: "")
        
        signalProducer.on(starting: {
            self.isReloaded.value = false
        }, failed: { (error) in
            print("Error: \(error.description)")
            self.isReloaded.value = false
        }, completed: {
            self.isReloaded.value = true
            self.reloadDataPipe.1.send(value: ())
        }, interrupted: {
            self.isReloaded.value = false
        }) { (data) in
            self.receivedData = data
        }
        .start()

    }
    
}
