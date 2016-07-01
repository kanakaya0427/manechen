//
//  GraphViewController.swift
//  manechen
//
//  Created by NakayaKana on 2016/06/27.
//  Copyright © 2016年 NakayaKana. All rights reserved.
//

import UIKit
import Charts

class GraphViewController: UIViewController {
    
    
    @IBOutlet weak var pieChartView: PieChartView!
    

    let saveData = NSUserDefaults.standardUserDefaults()
    var sougakuArray: [AnyObject] = []

    

    override func viewDidLoad(){
        super.viewDidLoad()
        
        print(saveData.arrayForKey("KINGAKU"))
        
        saveData.setObject(sougakuArray, forKey:"SOUGAKU")
        
         func setupPieChartView() {
            self.pieChartView.usePercentValuesEnabled = true
            self.pieChartView.descriptionText = "カテゴリ別の使用割合"
            
            let kategori = NSUserDefaults.standardUserDefaults().integerForKey("kategori")
            
             //円グラフに表示するデータ
            
            var sum = 0
            for item in kategori {
                let sougaku = Int(item["kategori"] as! String)!
                sum += money
            }
            print(sum)

            
            for index in (1...4).reverse() {
                kategori.append(ChartDataEntry(value: Double(index) * 10.0, xIndex: index))
            }
            let dataSet = PieChartDataSet(yVals:kategori, label: "カテゴリ名")
            dataSet.colors = ChartColorTemplates.colorful()
            let data = ChartData(xVals: ["食費", "交通費", "衣服", "美容", "交際費","医療費"], dataSet: dataSet)
            
            let numberFormatter = NSNumberFormatter()
            numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle;
            numberFormatter.maximumFractionDigits = 1;
            numberFormatter.multiplier = NSNumber(int: 1)
            numberFormatter.percentSymbol = " %";
            data.setValueFormatter(numberFormatter)
            
            self.pieChartView.data = data
        }
        // Do any additional setup after loading the view.
    

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
