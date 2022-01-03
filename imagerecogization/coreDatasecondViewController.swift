//
//  coreDatasecondViewController.swift
//  imagerecogization
//
//  Created by Rahul Singh on 30/12/21.
//
    import UIKit
    import CoreData

    class coreDatasecondViewController: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()
            
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            
            let context = appDelegate.persistentContainer.viewContext
            
            let entity = NSEntityDescription.entity(forEntityName: "Users", in: context)
            let newUser = NSManagedObject(entity: entity!, insertInto: context)
            
            
            newUser.setValue("Shashikant", forKey: "username")
            newUser.setValue("1234", forKey: "password")
            newUser.setValue("12", forKey: "age")
            
            do {
                
                try context.save()
                
            } catch {
                
                print("Failed saving")
            }
            
            /// fetching method
            
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
            //request.predicate = NSPredicate(format: "age = %@", "12")
            request.returnsObjectsAsFaults = false

            do {
                let result = try context.fetch(request)
                for data in result as! [NSManagedObject] {
                   print(data.value(forKey: "username") as! String)
                }
                
            } catch {
                
                print("Failed")
            }

            // Do any additional setup after loading the view, typically from a nib.
        }

        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }


    }
