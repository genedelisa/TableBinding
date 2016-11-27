//
//  ViewController.swift
//  TableBinding
//
//  Created by Gene De Lisa on 7/10/15.
//  Copyright © 2015 Gene De Lisa. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {
    
    @IBOutlet var arrayController: NSArrayController!
       
    @IBOutlet var tableView: NSTableView!
    
    /// the data for the table
    dynamic var dataArray = [Person]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create some people
        dataArray.append(Person(givenName: "Noah", familyName: "Vale", age: 72))
        dataArray.append(Person(givenName: "Sarah", familyName: "Yayvo", age: 29))
        dataArray.append(Person(givenName: "Shanda", familyName: "Lear", age: 45))
        dataArray.append(Person(givenName: "Heidi", familyName: "Clare", age: 45))
        dataArray.append(Person(givenName: "Helen", familyName: "Back", age: 45))
        dataArray.append(Person(givenName: "Jack", familyName: "Haas", age: 33))
        dataArray.append(Person(givenName: "Justin", familyName: "Case", age: 32))
        dataArray.append(Person(givenName: "Ophelia", familyName: "Payne", age: 44))
        dataArray.append(Person(givenName: "Justin", familyName: "Case", age: 54))
        dataArray.append(Person(givenName: "Paige", familyName: "Turner", age: 55))
        dataArray.append(Person(givenName: "Rick", familyName: "O'Shea", age: 65))
        dataArray.append(Person(givenName: "Rick", familyName: "Shaw", age: 23))
        dataArray.append(Person(givenName: "Sal", familyName: "Minella", age: 11))
        dataArray.append(Person(givenName: "Seth", familyName: "Poole", age: 25))
        dataArray.append(Person(givenName: "Russell", familyName: "Leeves", age: 33))
        dataArray.append(Person(givenName: "Sonny", familyName: "Day", age: 76))
        dataArray.append(Person(givenName: "Stan", familyName: "Still", age: 69))
        dataArray.append(Person(givenName: "Stanley", familyName: "Cupp", age: 65))
        dataArray.append(Person(givenName: "Sue", familyName: "Flay", age: 54))
        dataArray.append(Person(givenName: "Tim", familyName: "Burr", age: 51))
        dataArray.append(Person(givenName: "Tommy", familyName: "Hawk", age: 27))
        dataArray.append(Person(givenName: "Warren", familyName: "Peese", age: 38))
        dataArray.append(Person(givenName: "Sue", familyName: "Scheph", age: 41))
        dataArray.append(Person(givenName: "Will", familyName: "Power", age: 42))
        dataArray.append(Person(givenName: "Woody", familyName: "Forrest", age: 62))
        dataArray.append(Person(givenName: "X.", familyName: "Benedict", age: 88))
        dataArray.append(Person(givenName: "V.", familyName: "Gates", age: 39))

    }

   
    // these actions are not used. Instead, in IB I set the buttons' action to the array controller's actions.
    // the problem is, how do scroll to the newly inserted item as you can do here?
    @IBAction func addPerson(_ sender: NSButton) {
        arrayController.addObject(Person())
        DispatchQueue.main.async {
            self.tableView.scrollRowToVisible(self.dataArray.count - 1)
        }
    }

    // not used, but if you wanted to get the selection, this is one way.
    @IBAction func removePerson(_ sender: NSButton) {
        if let selectedPerson = arrayController.selectedObjects.first as? Person {
            arrayController.removeObject(selectedPerson)
        }
    }
    
    @IBAction func showAll(_ sender: NSButton) {
        for person in arrayController.arrangedObjects as! [Person] {
            print("\(person.givenName) \(person.familyName) \(person.age) ")
        }
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }


}

