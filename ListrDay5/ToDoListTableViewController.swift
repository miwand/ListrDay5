//
//  ToDoListTableViewController.swift
//  ListrDay5
//
//  Created by Miwand Najafe on 2015-08-22.
//  Copyright (c) 2015 Miwand Najafe. All rights reserved.
//

import UIKit

class ToDoListTableViewController: UITableViewController {

    @IBAction func unwindAddToDoListViewController(segue: UIStoryboardSegue) {
        print("success")
   
        var source: AddToDoListViewController = segue.sourceViewController as! AddToDoListViewController
        if var item: ToDoItem = source.toDoItem {
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
    }
    
    var toDoItems: NSMutableArray = []
    
    //loads initial data
    func loadInitialData() {
        
        var item1 = ToDoItem(name: "Buy Milk")
        self.toDoItems.addObject(item1)
        var item2 = ToDoItem(name: "Buy eggs")
        self.toDoItems.addObject(item2)
        var item3 = ToDoItem(name: "Read a book")
        self.toDoItems.addObject(item3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInitialData()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.

        return toDoItems.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ListPrototypeCell", forIndexPath: indexPath) as! UITableViewCell

        
        
        var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        cell.textLabel!.text = todoitem.itemName as String
        
        //adds checmark and removes checkmark when item is tapped
        if todoitem.completed{ cell.accessoryType = .Checkmark
                } else { cell.accessoryType = .None
            }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as! ToDoItem
        tappedItem.completed = !tappedItem.completed
        
        tableView.reloadData()
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    
//     Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            toDoItems.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
           
        }
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
