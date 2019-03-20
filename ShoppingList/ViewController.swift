//
//  ViewController.swift
//  ShoppingList
//
//  Created by Robert Wadlow on 5/1/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var newItemTextfield: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    let defaults = UserDefaults.standard
    
    var items : [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let item1 = Item(name: "Milk", quantity: 2)
        let item2 = Item(name: "Eggs", quantity: 16)
        items = [item1,item2]
        
        if let savedItems = defaults.object(forKey: "arrayOfItems"){
            items = savedItems as! [Item]
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CellId") {
            let currentItem = items[indexPath.row]
            cell.textLabel?.text = currentItem.name
            cell.detailTextLabel?.text = "Quantity: \(currentItem.quantity!)"
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return items.count
    }
    
    @IBAction func whenAddItemButtonPressed(_ sender: UIBarButtonItem) {
        if let newItemName = newItemTextfield.text  {
            let newItem = Item(name: newItemName, quantity: 1)
            items.append(newItem)
            tableView.reloadData()
            defaults.set(items, forKey: "arrayOfItems")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            let item = items[indexPath.row]
            let vc = segue.destination as! DetailsViewController
            vc.item = item
        }
    }
}

