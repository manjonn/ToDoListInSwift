//
//  AddToDoViewController.swift
//  SwiftToDoList
//
//  Created by Manjula Jonnalagadda on 6/9/14.
//  Copyright (c) 2014 Manjula Jonnalagadda. All rights reserved.
//

import UIKit

protocol AddToDoViewControllerDelegate{

    func toDoItemAdded(var toDo:ToDo)
    
}


class AddToDoViewController: UIViewController, UITextFieldDelegate {
    

    var dateFormatter:NSDateFormatter=NSDateFormatter()

    @IBOutlet var toDotextField : UITextField
    @IBOutlet var dateBtn : UIButton
    @IBOutlet var dateToolbar : UIToolbar
    @IBOutlet var datePicker : UIDatePicker
    
    @IBAction func dateBtnTapped(sender : UIButton) {
        
        if toDotextField.isFirstResponder(){
            return
        }
        
        dateToolbar.hidden=false
        datePicker.hidden=false
        
    }
    
    @IBAction func datePickingCanceled(sender : UIBarButtonItem) {
        
        dateToolbar.hidden=true
        datePicker.hidden=true
        
    }
    
    @IBAction func datePicked(sender : UIBarButtonItem) {
        
        dateToolbar.hidden=true
        datePicker.hidden=true
        dateBtn.setTitle(dateFormatter.stringFromDate(datePicker.date), forState: UIControlState.Normal)

        
    }
    
    var delegate:AddToDoViewControllerDelegate?
    
    func validate() -> Bool{
        
        if !dateToolbar.hidden{
            
            return false
        }
        
        if toDotextField.isFirstResponder(){
            
            return false
            
        }
        
        if toDotextField.text.isEmpty{
            
            return false
            
        }
        
        if dateBtn.currentTitle=="Date"{
            
            return false
        }
        
        return true
        
    }

    
    @IBAction func save(sender : UIButton) {
        
        if !validate(){
            
            return
            
        }
        let toDo:ToDo=ToDo(toDo: toDotextField.text, date: datePicker.date)
        delegate?.toDoItemAdded(toDo)
        self.navigationController.popViewControllerAnimated(true)
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat="dd-MMM-yy hh:mm a"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
       
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldBeginEditing(textField: UITextField!) -> Bool{
        
        if !dateToolbar.hidden{
            
            return false
        }
        return true
        
    }

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */
    


}
