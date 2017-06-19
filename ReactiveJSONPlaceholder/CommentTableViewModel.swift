//
//  CommentTableViewModel.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import ReactiveSwift
import Result
import ReactiveJSON


class CommentTableViewModel {
    
    
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

    
    func getCommentCellViewModel(atIndex index: Int) -> CommentCellViewModel? {
        if !receivedData.indices.contains(index) {
            return nil
        }
        
        let data = receivedData[index]
        let e:Entity<Int> = Entity<Int>(data as! [String:AnyObject])
        guard let comment: CommentModel = CommentModel(withEntity: e) else {
            return nil
        }
        return CommentCellViewModel(withCommentModel: comment)
        
        // return CommentCellViewModel(withEntity: Entity<Int>(receivedData[index] as! [String:AnyObject]))
    }
    
    
    
    
    func request() {
        
        let signalProducer:SignalProducer<Array<AnyObject>, NetworkError> = JSONPlaceholderCommentService.request(endpoint: "")
        
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
