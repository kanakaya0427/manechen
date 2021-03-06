//
//  KinyuViewController.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/18.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit

class KinyuViewController: UIViewController,UITextFieldDelegate,UIPickerViewDelegate{
    
    
    
    @IBOutlet var yosanLabel : UILabel!
    @IBOutlet var sougakuLabel : UILabel!
    
    @IBOutlet weak var shiyouTextField : UITextField!
    
    
    var toolBar:UIToolbar!
    var DatePicker: UIDatePicker!
    
    @IBOutlet var dateTextField: UITextField!
    
    @IBOutlet weak var mySeg: UISegmentedControl!

    
    @IBOutlet weak var kategoriTextField : UITextField!

    var pickOption = ["食費", "交通費", "衣服", "美容", "交際費","医療費"]
    
    var bunsekiArray: [AnyObject] = []
    let saveData = NSUserDefaults.standardUserDefaults()

    
    var sendText:String = ""
    
    
    
    
    
    
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
        kategoriTextField.inputAccessoryView = toolBar
     
         textFieldEditing(dateTextField)
        
        let pickerView = UIPickerView()
        
        pickerView.delegate = self
        
        kategoriTextField.inputView = pickerView
        
        if saveData.arrayForKey("SOUGAKU") != nil{
            bunsekiArray = saveData.arrayForKey("SOUGAKU")!
        }
        
        
        
        let yosan = NSUserDefaults.standardUserDefaults().integerForKey("yosan")
        yosanLabel.text = "\(yosan)"
        
        let sougaku = NSUserDefaults.standardUserDefaults().integerForKey("sougaku")
        sougakuLabel.text = "\(sougaku)"
        
        if sougaku >= yosan{
            sougakuLabel.textColor = UIColor.redColor()
        }else if sougaku < yosan{
            sougakuLabel.textColor = UIColor.blackColor()
        }

    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        kategoriTextField.text = pickOption[row]
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
        kategoriTextField.resignFirstResponder()
    }
    
    
    @IBAction func OKButton(sender: UIButton){
        
//        
//        if let text = shiyouTextField.text, shiyou = Int(text) {
//            NSUserDefaults.standardUserDefaults().setInteger(shiyou), forKey: "shiyou")
//            NSUserDefaults.standardUserDefaults().synchronize()
        
        
        let bunsekiDictionary = ["hiduke":dateTextField.text!,"shiyou":shiyouTextField.text!,"kategori":kategoriTextField.text!,"type":["カード","現金"][mySeg.selectedSegmentIndex]]
        
        
        
        bunsekiArray.append(bunsekiDictionary)
        saveData.setObject(bunsekiArray, forKey: "SOUGAKU")
        
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
        
        var sum = 0
        for item in bunsekiArray {
            let money = Int(item["shiyou"] as! String)!
            sum += money
        }
        print(sum)
        
        sougakuLabel.text = "\(sum)"
        
        NSUserDefaults.standardUserDefaults().setInteger(sum, forKey: "sougaku")
        NSUserDefaults.standardUserDefaults().synchronize()
        
       
        
        self.presentViewController(alert, animated: true, completion:nil)
        dateTextField.text = ""
        shiyouTextField.text = ""
        kategoriTextField.text = ""
        
        
        
     
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
