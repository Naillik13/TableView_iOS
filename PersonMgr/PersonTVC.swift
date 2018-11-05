//
//  PersonTVC.swift
//  PersonMgr
//
//  Created by killian galea on 24/10/2018.
//  Copyright © 2018 killiangalea. All rights reserved.
//

import UIKit

class PersonTVC: UITableViewController
{
    var marc = Person.init(firstName: "Marc", lastName: "DREAM")
    var john = Person.init(firstName: "John", lastName: "DOE")
    var sera = Person.init(firstName: "Sera", lastName: "PHINA")
    var aslo = Person.init(firstName: "Aslo", lastName: "OLSA")
    var anthony = Person.init(firstName: "Anthony", lastName: "DREAM")
    
    var arrayPerson: [Person] = [Person]()
    
    var personChange: Person?
    var personChangeIndex: Int?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        arrayPerson.append(marc)
        arrayPerson.append(john)
        arrayPerson.append(sera)
        arrayPerson.append(aslo)
        arrayPerson.append(anthony)
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        self.navigationItem.rightBarButtonItem = self.editButtonItem
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        // #warning Incomplete implementation, return the number of rows
        return (arrayPerson.count)
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        
        cell.textLabel!.text = arrayPerson[indexPath.row].firstName + " " + arrayPerson[indexPath.row].lastName
        
        let age = 2018 - arrayPerson[indexPath.row].birthYear
        cell.detailTextLabel!.text = arrayPerson[indexPath.row].gender + " - \(age) years old"
        return cell
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayPerson.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.reloadData()
        } else if editingStyle == .insert {
            print("hey")
            
        }    
    }
    
    
    

    
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        arrayPerson.swapAt(fromIndexPath.row , to.row)
        tableView.reloadData()

    }
    

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "pushDetail"
        {
            let personDetailVC: PersonDetailVC = segue.destination as! PersonDetailVC
            var indexPath = self.tableView.indexPath(for: sender as! UITableViewCell)
            let person = arrayPerson[indexPath!.row]
            
            personDetailVC.person = person
            personDetailVC.personIndex = indexPath!.row
        }
        
        if segue.identifier == "newPerson"
        {
            let personDetailVC: PersonDetailVC = segue.destination as! PersonDetailVC
            
            personDetailVC.personIndex = arrayPerson.count
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if (personChange != nil && personChangeIndex != nil)
        {
            if arrayPerson.count == personChangeIndex
            {
                arrayPerson.append(personChange!)
            }
            
        }
        
        tableView.reloadData()
    }
    
    @IBAction func cancel(segue:UIStoryboardSegue) {
        
    }
    
    @IBAction func done(segue:UIStoryboardSegue) {
        let personDetailVC = segue.source as! PersonDetailVC
        
        if personDetailVC.personIndex == arrayPerson.count && personDetailVC.person != nil{
            let newPerson = personDetailVC.person
            arrayPerson.append(newPerson!)
            tableView.reloadData()
        }
        

    }

}
