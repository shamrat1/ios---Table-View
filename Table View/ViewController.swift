//
//  ViewController.swift
//  Table View
//
//  Created by Leads Computer on 12/10/19.
//

import UIKit

var allTime = ["Bun","Pie Cake","Choco cake","Toast","Biscuit"]
var allTimeImage = [UIImage(named: "bun"),UIImage(named: "bun"),UIImage(named: "bun"),UIImage(named: "bun"),UIImage(named: "bun")]
var indexVar = 0

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var productName: UITextField!
 
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return allTime.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = allTime[indexPath.row]
        cell.imageView?.image = allTimeImage[indexPath.row]
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete {
            allTime.remove(at: indexPath.row)
            tableView.reloadData()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        indexVar = indexPath.row
        performSegue(withIdentifier: "singleSegue", sender: self)
    }
    @IBAction func addButton(_ sender: UIButton) {
        if productName.text != ""{
            allTime.append(productName.text!)
            allTimeImage.append(UIImage(named: "bun"))
            productName.text = nil
            tableView.reloadData()
            
        }else {
            productName.layer.borderColor = UIColor.red.cgColor
            productName.layer.borderWidth = 1.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                self.productName.layer.borderWidth = 0.0
            })
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

