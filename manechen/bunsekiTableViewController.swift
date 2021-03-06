//
//  bunsekiTableViewController.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/24.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit

class bunsekiTableViewController: UITableViewController {
    
    var sougakuArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()
    
    
    var index = 0


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem()
        
        tableView.registerNib(UINib(nibName: "bunsekiTableViewCell", bundle: nil),forCellReuseIdentifier:"cell")

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        if saveData.arrayForKey("SOUGAKU") != nil {
            sougakuArray = saveData.arrayForKey("SOUGAKU")!
        }
        
        print(saveData.arrayForKey("SOUGAKU"))
        self.tableView.estimatedRowHeight = 44
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
       
        saveData.setObject(sougakuArray, forKey:"SOUGAKU")
      
  
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if saveData.arrayForKey("SOUGAKU") != nil{
            sougakuArray = saveData.arrayForKey("SOUGAKU")!
        }
        tableView.reloadData()
        //        listTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (saveData.arrayForKey("SOUGAKU")?.count ) ?? 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as!bunsekiTableViewCell

      
        var data = saveData.arrayForKey("SOUGAKU")
        
       
        
        cell.dateLabel.text = data![indexPath.row]["hiduke"] as? String
        cell.shiyouLabel.text = data![indexPath.row]["shiyou"] as? String
        cell.kategoriLabel.text = data![indexPath.row]["kategori"] as? String
        cell.typeLabel.text = data![indexPath.row]["type"]as? String

        
        // Configure the cell...

        return cell
    }
    
    override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.editing = editing
    }

    
    // Override to support conditional editing of the table view.
  override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
 
    

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.index = indexPath.row
        self.performSegueWithIdentifier("toSubView", sender: nil)
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == UITableViewCellEditingStyle.Delete{
        sougakuArray.removeAtIndex(indexPath.row)
//        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        saveData.setObject(sougakuArray, forKey: "SOUGAKU")
        tableView.reloadData()    }
    
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
      override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
