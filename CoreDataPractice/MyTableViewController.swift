//
//  MyTableViewController.swift
//  CoreDataPractice
//
//  Created by Priya patel on 09/01/20.
//  Copyright © 2020 Priya patel. All rights reserved.
//

import UIKit
import CoreData

class MyTableViewController: UITableViewController {
    
    // Step 1
    var managecontextobject = NSManagedObjectContext()
    
    var manageobject = NSManagedObject()
    
    var list:[NSManagedObject] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()

        //Step 2
        let appDel = UIApplication.shared.delegate as! AppDelegate
        
        self.managecontextobject = appDel.persistentContainer.viewContext
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // Step 3
    func listdata()
    {
        let fetchreq = NSFetchRequest<NSFetchRequestResult>(entityName: "Person")
        
        do {
                self.list = try self.managecontextobject.fetch(fetchreq) as! [NSManagedObject]
                for item in self.list
                {
                    print("okay")
                }
            } catch  {
                print("error")
            }
            
            tableView.reloadData()
        }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        cell.textLabel?.text = "\(self.list[indexPath.row].value(forKey: "name"))"
        cell.detailTextLabel?.text = "\(self.list[indexPath.row].value(forKey: "branch"))"
        
        cell.textLabel?.text = "\(self.list[indexPath.row].value(forKey: "name"))"

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
