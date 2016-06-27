//
//  SetteiViewController.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/25.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit

class SetteiViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet weak var yosanTextField: UITextField!
    
    var toolBar:UIToolbar!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yosanTextField.borderStyle = UITextBorderStyle.RoundedRect
        yosanTextField.keyboardType = .NumberPad
        self.view.addSubview(yosanTextField)
        
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "完了", style: .Plain, target: self, action: #selector(SetteiViewController.doneBtn))
        toolBar.items = [toolBarBtn]
        yosanTextField.inputAccessoryView = toolBar
        
       
     

        // Do any additional setup after loading the view.
    }
    
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        
//        if segue.identifier == "SecondView" {
//            
//            let secondViewController:KinyuViewController = segue.destinationViewController as! KinyuViewController
//            
//
//              secondViewController.sendText = self.yosanTextField.text!
//        }
//        
//        
//    }
    
    
    func doneBtn(){
        yosanTextField.resignFirstResponder()
    }
    
    @IBAction func OKButton(sender: UIButton){

        if let text = yosanTextField.text, yosan = Int(text) {
             NSUserDefaults.standardUserDefaults().setInteger(yosan, forKey: "yosan")
             NSUserDefaults.standardUserDefaults().synchronize()
        }
       
        
        
        let alert = UIAlertController(
            title:"" ,
            message: "記入が完了しました" ,
            preferredStyle:  UIAlertControllerStyle.Alert)
        alert.addAction(
            UIAlertAction(
                title: "OK" ,
                style: UIAlertActionStyle.Default,
                handler: nil
                
            )
        )
        
         self.presentViewController(alert, animated: true, completion:nil)
    
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
