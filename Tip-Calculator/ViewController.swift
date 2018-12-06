//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by Joy Paul on 12/3/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    
    //TODO add a label to show the total cost

    //outlet for the pieChartView
  
    @IBOutlet weak var pieChart: PieChartView!
    @IBOutlet weak var bill: UITextField!
    @IBOutlet weak var tipPercentage: UITextField!
    
    var initialPrice: Double = 1.0
    var payTips: Double = 1.0
    
    //vars to hold the meal, tip and total price
    //meal and tips is being initialized as 0
    var mealPrice = PieChartDataEntry(value: 0)
    var tips = PieChartDataEntry(value: 0)
    var totalCost = [PieChartDataEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //setting bill and tipPercentage keyboard to decimalPad
        self.bill.keyboardType = UIKeyboardType.decimalPad
        self.tipPercentage.keyboardType = UIKeyboardType.decimalPad
        
        //initiating a tap gesture variable
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
        //adding it to the view's tabGesture array
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func calculateTipButton(_ sender: UIButton) {
        //getting the inouts as doubles
        let mealPriceInput = Double(bill.text!)
        let tipPercentInput = Double(tipPercentage.text!)
        
        //checking to see if they aren't null
        if (mealPriceInput != nil && tipPercentInput != nil){
            let t = calculateTip(money: mealPriceInput!, tip: tipPercentInput!)
            payTips = t
            initialPrice = mealPriceInput!
            getChartData()
            updateChartData()
            viewTapped()
        }
    }
    
    //func to calculate tips
    func calculateTip(money: Double, tip: Double) -> Double{
        viewTapped()
        let a = (money / 100) * tip
        return a
        
    }
    
    //updateting the price variables
    func getChartData(){
        mealPrice.value = initialPrice
        mealPrice.label = "Meal cost"
        
        tips.value = payTips
        tips.label = "Tips"
        
        totalCost = [mealPrice, tips]
    }
    
    //updating the graph with the updated variables
    func updateChartData(){
        let chartDataSet = PieChartDataSet(values: totalCost, label: nil)
        let chartData = PieChartData(dataSet: chartDataSet)
        
        let colors = [#colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1), #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)]
        chartDataSet.colors = colors
        
        pieChart.data = chartData
    }
    
    //func to detect endediting on the text fields
    @objc func viewTapped(){
        bill.endEditing(true)
        tipPercentage.endEditing(true)
    }
    
}

