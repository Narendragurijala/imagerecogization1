//
//  coredatathreeViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 30/12/21.
//

    import UIKit
    import CoreData
      
    class coredatathreeViewController: UIViewController {
      
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        var context = NSManagedObjectContext()
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view.
              
            context = appDelegate.persistentContainer.viewContext
              
            let entity = NSEntityDescription.entity(forEntityName: "Student", in: context)
            let newStudent = NSManagedObject(entity: entity!, insertInto: context)
            newStudent.setValue("John", forKey: "name")
            newStudent.setValue(23, forKey: "age")
            newStudent.setValue(1, forKey: "id")
              
            do{
                try context.save()
         fetchData()
            }catch{
                debugPrint("Can't save")
            }
        }
        func fetchData(){
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
            request.returnsObjectsAsFaults = false
            do{
                let result = try context.fetch(request)
                for data in result{
                    debugPrint((data as AnyObject).value(forKey: "name") as! String)
                    debugPrint((data as AnyObject).value(forKey: "id") as! Int16)
                    debugPrint((data as AnyObject).value(forKey: "age") as! Int32)
                }
            }catch{
            }
        }
    }
