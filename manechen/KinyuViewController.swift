//
//  KinyuViewController.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/18.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit

class KinyuViewController: UIViewController,UITextFieldDelegate{
    
    
    
    @IBOutlet var yosanLabel : UILabel!
    @IBOutlet var sougakuLabel : UILabel!
    
    @IBOutlet weak var shiyouTextField : UITextField!
    

    @IBOutlet weak var dateTextField: UITextField!
    var toolBar:UIToolbar!
    var DatePicker: UIDatePicker!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        shiyouTextField.borderStyle = UITextBorderStyle.RoundedRect
        shiyouTextField.keyboardType = .NumberPad
        self.view.addSubview(shiyouTextField)
        
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .Plain, target: self, action: #selector(KinyuViewController.doneBtn))
        toolBar.items = [toolBarBtn]
        dateTextField.inputAccessoryView = toolBar
        shiyouTextField.inputAccessoryView = toolBar
        
        
    }
    
    
    func textFieldEditing(sender: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Date
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(KinyuViewController.datePickerValueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
    }
    

    func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat  = "yyyy/MM/dd";
        dateTextField.text = dateFormatter.stringFromDate(sender.date)
    }
 
    
    
    func doneBtn(){
        dateTextField.resignFirstResponder()
        shiyouTextField.resignFirstResponder()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func textFieldDidBeginEditing(textField: UITextField){
        print("textFieldDidBeginEditing:" + textField.text!)
    }

    func textFieldShouldEndEditing(textField: UITextField) -> Bool {
        print("textFieldShouldEndEditing:" + textField.text!)
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        if(shiyouTextField.isFirstResponder()){
            shiyouTextField.resignFirstResponder()
        }
        
        
        
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    }}
