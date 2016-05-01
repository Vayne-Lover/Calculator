//
//  CalculatorViewController.swift
//  MyCalculator
//
//  Created by 姜况童 on 16/4/17.
//  Copyright © 2016年 姜况童. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        NSThread.sleepForTimeInterval(1.0)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var showLabel: UILabel!
    var notZero:Bool=false
    @IBAction func appendDigit(sender: UIButton) {
        let digit=sender.currentTitle!
        if(notZero){
            showLabel.text=showLabel.text!+digit
        } else if notZero==false && digit=="0"{
            showLabel.text="0"
        } else {
        showLabel.text=digit
        notZero=true
        }
    }
    var result:(Double,Double,String)=(0,0,"+")
    var resultbak:(Double,Double,String)=(0,0,"+")
    var labelValue:Double{
        get{
            let temp:String?=showLabel.text!
            if temp != nil {
                return Double(showLabel.text!)!
            } else {
                return 0
            }
        }
        set{
        showLabel.text="\(newValue)"
        }
    }
    var labelText:String{
        get{return showLabel.text!}
        set{showLabel.text=newValue}
    }
    @IBAction func operate(sender: UIButton) {
        if resultbak.0 != 0{
            let operation=sender.currentTitle!
            resultbak.1=labelValue
            result=cm.evaluate(resultbak)
            result.1=0
            result.2=operation
            labelText=operation
            //labelValue=0
            notZero=false
            resultbak=result
        } else {
            let operation=sender.currentTitle!
            result.0=labelValue
            result.2=operation
            labelText=operation
            //labelValue=0
            notZero=false
            resultbak=result//0,1 question can  x/0,+0,-0,*0
        }
    }
    
    @IBAction func clear() {
        showLabel.text="0"
        notZero=false
        resultbak=(0,0,"+")
    }
    var cm=CalculatorModel()
    @IBAction func equal() {
        result.1=labelValue
        result=cm.evaluate(result)
        labelValue=result.0
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
