//
//  ViewController.swift
//  Table View
//
//  Created by Leads Computer on 12/10/19.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var allTime = ["Bun","Pie Cake","Choco cake","Toast","Biscuit"]
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productName: UITextField!
 
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = "All Time \(allTime[indexPath.row])"
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            allTime.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    @IBAction func addButton(_ sender: UIButton) {
        allTime.append(productName.text!)
        productName.text = nil
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

