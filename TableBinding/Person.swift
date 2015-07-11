//
//  Person.swift
//  TableBinding
//
//  Created by Gene De Lisa on 7/10/15.
//  Copyright © 2015 Gene De Lisa. All rights reserved.
//

import Foundation


class Person : NSObject {
    var givenName:String
    var familyName:String
    var age = 0
    
    override init() {
        givenName = "given"
        familyName = "family"
        super.init()
    }
    
    init(givenName:String, familyName:String, age:Int) {
        self.givenName = givenName
        self.familyName = familyName
        self.age = age
        super.init()
    }
     
}
