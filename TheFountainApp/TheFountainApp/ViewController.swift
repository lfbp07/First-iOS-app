//
//  ViewController.swift
//  TheFountainApp
//
//  Created by lfbp on 02/03/20.
//  Copyright © 2020 lfbp. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    

    @IBOutlet var estimateButton: UIButton!
    @IBOutlet var inputPeople: UITextField!
    @IBOutlet var GallonsOrLiters: UISegmentedControl!
    @IBOutlet var popUpView: UIView!
    @IBOutlet var answerText: UILabel!
    @IBOutlet var unitLabel: UILabel!
    @IBOutlet var unitMagnitude: UITextField!
    var blurEffectView = UIVisualEffectView()
    
    var ans:waterQuantity = waterQuantity(qInLiters:0.0, qInGallons:0.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func allowEstimation() {
        
        if inputPeople.text == "" || unitMagnitude.text == ""{
            estimateButton.alpha = 0.3
            estimateButton.isEnabled = false
        }else if inputPeople.text != "" && unitMagnitude.text != "" && estimateButton.isEnabled == false{
            estimateButton.alpha = 1
            estimateButton.isEnabled = true
        }
    }
    
    @IBAction func closeClicked() {
        estimateButton.isHidden = !estimateButton.isHidden
        popUpView.isHidden = !popUpView.isHidden
        blurEffectView.removeFromSuperview()
    }
    
    @IBAction func estimateClicked() {
        let total = ans.Total(peopleNumber: inputPeople.text!, waterRatial: unitMagnitude.text!)
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.light)
        blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth,.flexibleHeight]
        blurEffectView.alpha = 1
        view.addSubview(blurEffectView)
        view.bringSubviewToFront(popUpView)
        let totalString = String(format: "%.1f", total)
        var unitString = ""
        if GallonsOrLiters.selectedSegmentIndex == 1{
            unitString = "gallons"
        }
        else{
            unitString = "liters"
        }
        answerText.text = "Total needed:\n" + totalString + " " + unitString
        
        estimateButton.isHidden = !estimateButton.isHidden
        popUpView.isHidden = !popUpView.isHidden
    }

    @IBAction func unitSelected() {
        
        if GallonsOrLiters.selectedSegmentIndex == 1 {
            print("unit in gallons")
            unitLabel.text = "Gallons per person:"
            //unitMagnitude.text = String(format:"%.1f",liters)
        }else if GallonsOrLiters.selectedSegmentIndex == 0{
            print("unit in liters")
            unitLabel.text = "Liters per person:"
            //unitMagnitude.text = String(format:"%.1f",gallons)
        }
    }
}

