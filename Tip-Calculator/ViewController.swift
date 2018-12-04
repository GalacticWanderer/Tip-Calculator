//
//  ViewController.swift
//  Tip-Calculator
//
//  Created by Joy Paul on 12/3/18.
//  Copyright © 2018 Joy Paul. All rights reserved.
//

import UIKit
import PieCharts

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadInChart()
        
        //TODO: seperate the chart from the input
        //set them up as multi-page operations
        //TODO: after the previous steps, integrate
        //a setting page with some useful options
    }
    
  
    @IBOutlet weak var chartView: PieChart!
    
    func loadInChart(){
        
        //adding a line text overlay
        chartView.layers = [PieLineTextLayer()]
        
        //insert the values + color of the slice
        chartView.models = [
            PieSliceModel(value: 3.2121, color: UIColor.brown),
            PieSliceModel(value: 3.323, color: UIColor.blue),
            PieSliceModel(value: 1.1212, color: UIColor.green)
        ]
    }
    

}

