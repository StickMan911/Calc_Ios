//
//  ViewController.swift
//  SSSSSS
//
//  Created by Admin on 14.08.17.
//  Copyright © 2017 Admin. All rights reserved.
//

import UIKit

var x:Double = 0
var y:Double = 0

var enterFlag = 1
var yFlag = 1

var decimalPoint = 0

var power = 1

var operationActive = 0

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func digitals(_ sender : UIButton)
    {
        if enterFlag == 1
        {
            x = 0
            enterFlag = 0
        }
        
     if decimalPoint == 0
     {
        
        x = x * 10 + Double(sender.tag)
        
       switch String(x)
       {
       case let z where z.hasSuffix(".0"):
        self.result.text = " " + String(Int(x))
       default:  self.result.text = " " + String(x)
        }
        }
      else
        
     {
        x = x + Double(sender.tag)/pow(10, Double(power))
         power += 1
        
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default:  self.result.text = " " + String(x)
        }
        

        }
    }
    

    @IBAction func operations(_ sender: UIButton)
    {
      if enterFlag != 1 && yFlag == 1
      {
        switch operationActive
        {
        case 1001:
            x = y + x
        case 1002:
            x = y - x
        case 1003:
            x = y * x
        case 1004:
            x = y / x
        default: self.result.text = " " + String(Int64(x))
          }
       }
        operationActive = sender.tag
        y = x
        yFlag = 1
        enterFlag = 1
        
        
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default:  self.result.text = " " + String(x)
        }
        

        
        decimalPoint = 0
        power = 1
    }
    
      @IBAction func clearAllclear(_ sender: Any)
    {
        decimalPoint = 0
        x = 0
        y = 0
        
        switch String(x)
        {
        case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
        default:  self.result.text = " " + String(x)
        }
        

         enterFlag = 1
        yFlag = 1
        
         power = 1
        
        operationActive = 0    }
    
    @IBAction func decimal(_ sender: Any)
    {
        let checkDemical = result.text?.range(of: ".") != nil
        if checkDemical
        {
            decimalPoint = 1
        }
        else
        {
            result.text = result.text! + "."
            decimalPoint = 1
        }

    }
    
    @IBAction func invers(_ sender: Any)
    {
        x = -x
        
        switch String(x)
        {
            case let z where z.hasSuffix(".0"):
            self.result.text = " " + String(Int(x))
            default:  self.result.text = " " + String(x)
        }

    }
    @IBOutlet weak var result: UILabel!
}

