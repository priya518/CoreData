//
//  ViewController.swift
//  CoreDataPractice
//
//  Created by Priya patel on 09/01/20.
//  Copyright © 2020 Priya patel. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    // Step 2 create 1 array
    var People:[NSManagedObject] = []
    
    
    //Step 1 : Outlet and Action
    
    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Branch: UITextField!
    
    @IBAction func Savebtn(_ sender: UIButton) {
        
        //step 4 
        self.save(nm: Name.text!, br: Branch.text!)
    }
    
    // Step 3 : create save function
    func save(nm:String , br:String)
    {
        // connect this variable to the AppDeleget file
        let appdeleget = UIApplication.shared.delegate as! AppDelegate
        
        let managecontext = appdeleget.persistentContainer.viewContext
        
        let entity = NSEntityDescription.entity(forEntityName: "Person", in: managecontext)!
        
        let user = NSManagedObject(entity: entity, insertInto: managecontext)
        
        user.setValue(Name.text, forKey: "name")
        user.setValue(Branch.text, forKey: "branch")
        
        do {
            
            try managecontext.save()
            People.append(user)
            print("Data Inserted")
            
            
        } catch let error as NSError {
            print("Error...!!")
        }
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

