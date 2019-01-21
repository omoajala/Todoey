//
//  ViewController.swift
//  Todoey
//
//  Created by Richard Ajala on 1/20/19.
//  Copyright © 2019 Richard Ajala. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    //new Item class created
    var itemArray = [Item]()
    
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //show the view
        let newItem = Item()
        newItem.title = "Buy Apples"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Buy Oranges"
        itemArray.append(newItem1)
        
        let newItem2 = Item()
        newItem2.title = "Make smoothies"
        itemArray.append(newItem2)
        
//        if let items = defaults.array(forKey: "ToDoListArray") as? [String] {
//            itemArray = items
//        }
    }
    
    //MARK - Tableview Datasource Method - helps display number of rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count //counts number of item in array
    }
    
    //helps display the cell and the contents
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none
        
//        if item.done == false {
//            cell.accessoryType = .checkmark
//        } else {
//            cell.accessoryType = .none
//        }
        
        return cell
    }
    
    //MARK - Tableview Delegate Methods - for selecting rows and removing the check marks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        //new code for checkmarks
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
//        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .none
//        } else {
//            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
//        }
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //local var to store the user text field
        
        //UIAlert
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        //UIAction
        let action = UIAlertAction(title: "Add New Item", style: .default) { (action) in
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem) //adds new item to the table view
            self.defaults.set(self.itemArray, forKey: "ToDoListArray")
            
            self.tableView.reloadData() //reloads data
        }
        
        //text field placeholder
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create a New Item"
            textField = alertTextField
            
        }
        
        //alert action
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
}

