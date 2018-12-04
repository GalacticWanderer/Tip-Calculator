//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by Joy Paul on 12/3/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

import UIKit
import PieCharts
import Charts

class ViewController: UIViewController {

    //outlet for the pieChartView
  
    @IBOutlet weak var pieChart: PieChartView!
    
    //vars to hold the meal, tip and total price
    //meal and tips is being initialized as 0
    var mealPrice = PieChartDataEntry(value: 0)
    var tips = PieChartDataEntry(value: 0)
    var totalCost = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getChartData()
        updateChartData()
        
    }
    
    func getChartData(){
        mealPrice.value = 80.0
        mealPrice.label = "Meal cost"
        
        tips.value = 20.0
        tips.label = "Tips"
        
        totalCost = [mealPrice, tips]
    }
    
    func updateChartData(){
        let chartDataSet = PieChartDataSet(values: totalCost, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
        chartDataSet.colors = colors
        
        pieChart.data = chartData
    }
    
    
    
  

    

}

