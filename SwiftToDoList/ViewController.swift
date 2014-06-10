//
//  ViewController.swift
//  SwiftToDoList
//
//  Created by Manjula Jonnalagadda on 6/9/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

import UIKit


var toDos:Array=ToDo[]()

class ViewController: UIViewController, UITableViewDataSource,AddToDoViewControllerDelegate {
    
    @IBOutlet var tableView : UITableView
    
    func createToDo(){
       
        for i in 0...3{
            let toDo:ToDo=ToDo(toDo: "To Do - \(i)", date: NSDate.date())
            toDos.append(toDo)
            
        }
        
        
    }
                            
    override func viewDidLoad() {
        super.viewDidLoad()
//        createToDo()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        
        let addViewController:AddToDoViewController=segue?.destinationViewController as AddToDoViewController
        addViewController.delegate=self
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }


    func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {
        
        let cellIdentifier="cell";
        var cell:UITableViewCell?=tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as? UITableViewCell
        if !cell{
            
            cell=UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
            
        }
        
        cell!.textLabel.text=toDos[indexPath.row].toDo
        
        return cell;
        
    }
    
    func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        
        return toDos.count
        
    }
    
    func toDoItemAdded(var toDo:ToDo){
        
        toDos.append(toDo)
        tableView.reloadData()
        
        
    }

}

