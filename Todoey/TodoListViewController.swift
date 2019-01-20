//
//  ViewController.swift
//  Todoey
//
//  Created by Richard Ajala on 1/20/19.
//  Copyright © 2019 Richard Ajala. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

    var itemArray = ["Buy Apple", "Make smoothie", "Exercise"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //MARK - Tableview Datasource Method - helps display number of rows
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count //counts number of item in array
    }
    
    //helps display the cell and the contents
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItemCell", for: indexPath)
        cell.textLabel?.text = itemArray[indexPath.row]
        return cell
    }
    
    //MARK - Tableview Delegate Methods - for selecting rows and removing the check marks
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //MARK - Add new Items

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField() //local var to store the user text field
        
        //UIAlert
        let alert = UIAlertController(title: "Add new todoey item", message: "", preferredStyle: .alert)
        
        //UIAction
        let action = UIAlertAction(title: "Add New Item", style: .default) { (action) in
            
            self.itemArray.append(textField.text!) //adds new item to the table view
            
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

