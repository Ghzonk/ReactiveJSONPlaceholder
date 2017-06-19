//
//  ModelTests.swift
//  ReactiveJSONPlaceholder
//
//  Created by Justin Hur on 6/19/17.
//  Copyright © 2017 Justin Hur. All rights reserved.
//

import Foundation
import Nimble
import Quick
import ReactiveJSON
import Result


@testable import ReactiveJSONPlaceholder

class ModelSpec : QuickSpec {
    
    override func spec() {
        describe("Post Model") {
            it("post count 100") {
                var out:Result<[AnyObject], NetworkError>?
                
                JSONPlaceholderPostService.request(endpoint: "")
                .startWithResult  { (result: Result<[AnyObject], NetworkError>) in
                
                    out = result
                }
                expect(out?.value?.count).toEventually(equal(100), timeout:5)
            }
        }
    }
    
}
