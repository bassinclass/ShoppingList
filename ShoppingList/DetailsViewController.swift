//
//  DetailsViewController.swift
//  ShoppingList
//
//  Created by Robert Wadlow on 5/1/18.
//  Copyright © 2018 MobileMakersEdu. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var quantityLabel: UILabel!
   
    var item: Item!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = item.name
        quantityLabel.text = "\(item.quantity!)"
    }
}
