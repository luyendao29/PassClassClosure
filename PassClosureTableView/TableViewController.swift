//
//  TableViewController.swift
//  PassClosureTableView
//
//  Created by Boss on 5/12/19.
//  Copyright © 2019 Boss. All rights reserved.
//

import UIKit

class Peron {
    var image: UIImage?
    var name:String?
    var age:String?
    init(image:UIImage,name:String,age:String) {
        self.image = image
        self.name = name
        self.age = age
    }
}

class TableViewController: UITableViewController {
    
    var perSon = [Peron]()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        perSon = [
            Peron(image:UIImage(named: "1")!, name: "binh", age: "20"),
            Peron(image:UIImage(named: "2")!, name: "khanh", age: "21"),
            Peron(image:UIImage(named: "3")!, name: "van", age: "22"),
            Peron(image:UIImage(named: "4")!, name: "khang", age: "23"),
            
        ]
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as? ViewController
        if let index = tableView.indexPathForSelectedRow{
            vc?.perSon = perSon[index.row]
            let listdata = perSon[index.row]
            vc?.myClosure = {
                [weak self] data in
                listdata.name = data!.name
                listdata.age = data!.age
                listdata.image = data!.image
//                            vc?.callBack = {[unowned self] data,data1, data2 in
//                                self.perSon[index.row].name = data
//                                self.perSon[index.row].age = data1
//                                self.perSon[index.row].image = data2
            
            }
            
        } else {
            vc?.myClosure = {
                [weak self] data in
                self?.perSon.append(data!)
            }
            
//                        vc?.callBack = {[unowned self] data, data1, data2 in
//              self.perSon.append(<#T##newElement: Peron##Peron#>)
//            self.perSon.append(Peron)
//                        }
        }
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return perSon.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let list = perSon[indexPath.row]
        cell.photo.image = list.image
        cell.labelname.text = list.name
        cell.labelage.text = list.age
        
        // Configure the cell...
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
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
