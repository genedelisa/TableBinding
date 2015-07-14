//
//  TableBindingTests.swift
//  TableBindingTests
//
//  Created by Gene De Lisa on 7/10/15.
//  Copyright © 2015 Gene De Lisa. All rights reserved.
//

import XCTest
@testable import TableBinding

class TableBindingTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testKVC() {
        
        let joe = Person(givenName: "joe", familyName: "blow", age: 22)
        XCTAssertNotNil(joe)

        _ = PersonObserver(person: joe)

        
        let givenName = joe.valueForKey("givenName")
        XCTAssertNotNil(givenName)
        XCTAssertEqual(joe.givenName, "joe")
        
        print(givenName)
        
        joe.setValue("schmoe", forKey: "familyName")
        XCTAssertEqual(joe.familyName, "schmoe")
        
    }
    
    func testPersonKVO() {
        let joe = Person(givenName: "joe", familyName: "blow", age: 22)

        let expectation = keyValueObservingExpectationForObject(joe,
            keyPath: "familyName",
            expectedValue: "schmoe")
        
        joe.setValue("schmoe", forKey: "familyName")
        
        waitForExpectationsWithTimeout(5) { error in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }

    }

    
}




class PersonObserver: NSObject {
    var obsContext = UInt8(42)
    var person:Person!
    
    init(person:Person) {
        super.init()
        self.person = person
        let options = NSKeyValueObservingOptions([.New, .Old])
        person.addObserver(self, forKeyPath: "givenName", options: options, context: &obsContext)
        person.addObserver(self, forKeyPath: "familyName", options: options, context: &obsContext)

    }
    
    deinit {
        person.removeObserver(self, forKeyPath: "givenName", context: &obsContext)
        person.removeObserver(self, forKeyPath: "familyName", context: &obsContext)
        
    }
    
    override func observeValueForKeyPath(keyPath: String?, ofObject object: AnyObject?, change: [String : AnyObject]?, context: UnsafeMutablePointer<Void>) {
        
        guard keyPath != nil else {
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
            return
        }
        
        switch (keyPath!, context) {
        case("givenName", &obsContext):
            print("Given name changed: \(change)")
            
        case("familyName", &obsContext):
            print("Family name changed: \(change)")
            
        case(_, &obsContext):
            assert(false, "unknown key path")
            
        default:
            super.observeValueForKeyPath(keyPath, ofObject: object, change: change, context: context)
        }
    }
}

