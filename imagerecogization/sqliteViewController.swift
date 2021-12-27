//
//  sqliteViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 20/12/21.
//

import UIKit

class sqliteViewController: UIViewController , UITableViewDelegate, UITableViewDataSource
{

    @IBOutlet weak var personTable: UITableView!
    
    let cellReuseIdentifier = "cell"
    
    var db:DBHelper = DBHelper()
    
    var persons:[Person] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        personTable.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        personTable.delegate = self
        personTable.dataSource = self
        
        
        db.insert(id: 0, name: "Bilal", age: 24)
        db.insert(id: 0, name: "Bosh", age: 25)
        db.insert(id: 0, name: "Thor", age: 23)
        db.insert(id: 0, name: "Edward", age: 44)
        db.insert(id: 0, name: "Ronaldo", age: 34)
        
        persons = db.read()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)!
        
        cell.textLabel?.text = "Name: " + persons[indexPath.row].name + ", " + "Age: " + String(persons[indexPath.row].age)
        
        return cell
    }
    
    
    
}
