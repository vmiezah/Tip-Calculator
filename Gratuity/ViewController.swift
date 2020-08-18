//
//  ViewController.swift
//  Tip
//
//  Created by Victor Miezah on 8/14/20.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sliderContainerView: UIView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!

    @IBOutlet weak var percentSlider: UISlider!
    
    @IBOutlet weak var splitPriceLabel: UILabel!
    @IBOutlet weak var perPersonLabel: UILabel!
    @IBOutlet weak var percentageContainerView: UIView!
    @IBOutlet weak var percentLabel: UILabel!
    @IBOutlet weak var perPersonStepper: UIStepper!
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var priceContainerView: UIView!
    
    var tipCalc = TipCalc(bill: 0, percent: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //keyboard appears immediately onLoad
        billField.becomeFirstResponder()
        // makes borders round for container
        containerView.layer.cornerRadius = 20.0
        percentageContainerView.layer.cornerRadius = 15.0
        sliderContainerView.layer.cornerRadius = 10.0
        lineView.layer.cornerRadius = 5
        priceContainerView.layer.cornerRadius = 25
        
        //added shadow effect to container
        priceContainerView.layer.shadowColor = UIColor.black.cgColor
        priceContainerView.layer.shadowOpacity = 0.6
        priceContainerView.layer.shadowOffset = .zero
        priceContainerView.layer.shadowRadius = 5
        
    }
    
    func calculate() {
        //calculate tip based off percent
        tipCalc.percent = Double(percentSlider.value)/100.0
        tipCalc.bill = (billField.text! as NSString).doubleValue
        tipCalc.calculate()
        update()
    }
    func update() {
        //updates the UI for total label and split label
        totalLabel.text = String(format: "$%.2f", tipCalc.total)
        splitPriceLabel.text = String(format: "$%.2f", tipCalc.total/Double(perPersonStepper.value))
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func slider(_ sender: UISlider){
        // updates percentlabel value to correspond with slider changes
        percentLabel.text = String(format: "%02d",Int(sender.value))
        calculate()
    }
    
    @IBAction func stepper(_ sender: UIStepper) {
        // updates perpersonlabel to correspond with stepper changes
        perPersonLabel.text = String(Int(sender.value))
        calculate()
    }
    
    @IBAction func billCalculate(_ sender: Any) {
        //computes calculations based off of textfield input
        calculate()
    }
}

