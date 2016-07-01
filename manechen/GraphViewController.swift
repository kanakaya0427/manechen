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
        
        
        setupPieChartView()
    }
    
    func setupPieChartView() {
        self.pieChartView.usePercentValuesEnabled = true
        self.pieChartView.descriptionText = "カテゴリ別の使用割合"
        
        guard saveData.arrayForKey("SOUGAKU") != nil else { return }
        
        let categories = ["食費", "交通費", "衣服", "美容", "交際費","医療費"]
        var sums: [Double] = []
        for cat in categories {
            let sum = calculateSumOfCategory(cat)
            sums.append(sum)
        }
        
        print(zip(categories, sums))
        
        //円グラフに表示するデータ
        var dataEntries = [ChartDataEntry]()
        
        for (i, catsum) in sums.enumerate() {
            let entry = ChartDataEntry(value: catsum, xIndex: i)
            dataEntries.append(entry)
        }
        
        print(dataEntries)
        
        let dataSet = PieChartDataSet(yVals: dataEntries, label: "カテゴリ名")
        dataSet.colors = ChartColorTemplates.colorful()
        let data = PieChartData(xVals: categories, dataSet: dataSet)
        
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.PercentStyle;
        numberFormatter.maximumFractionDigits = 1;
        numberFormatter.multiplier = NSNumber(int: 1)
        numberFormatter.percentSymbol = " %";
        data.setValueFormatter(numberFormatter)
        
        self.pieChartView.data = data
    }
    
    func calculateSumOfCategory(category: String) -> Double {
        guard let items = saveData.arrayForKey("SOUGAKU") as? [[String: String]] else { return  0 }
        
        var sum: Double = 0
        for item in items {
            if item["kategori"]! == category {
                sum += Double(item["shiyou"]!)!
            }
        }
        
        return sum
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
