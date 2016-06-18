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
    
    private var shiyouTextField : UITextField!
    private var dateTextField : UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shiyouTextField = UITextField(frame: CGRectMake(0,0,100,30))
        shiyouTextField.layer.position = CGPoint(x:240,y:160);
        shiyouTextField.delegate = self
        shiyouTextField.borderStyle = UITextBorderStyle.RoundedRect
        shiyouTextField.keyboardType = .NumberPad
        self.view.addSubview(shiyouTextField)

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
