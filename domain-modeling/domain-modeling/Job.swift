//
//  Job.swift
//  domain-modeling
//
//  Created by marco cheng on 10/15/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation

class Job : CustomStringConvertible{
    var title : String?
    var salary : Double?
    var salaryType : String?
  
    
    init (title : String?, salary : Double?, salaryType : String?){
        if(title == nil || salary == nil || salaryType == nil){
            print("This Job class contains nil property.")
        }else{
            self.title = title
            self.salary = salary
            self.salaryType = salaryType
        }
    }
    
    
    var description : String {
        return ("The salary of \(title!) is $\(salary!) \(salaryType!)")
    }
    
    func calculateIncome(hours : Double?) -> Double{
        var income : Double = 0
        if(title == nil || salary == nil || salaryType == nil || hours == nil){
            print("ERROR : Incorrect input!")
        }else{
            if(salaryType == "per-hour"){
                income =  hours! * salary!
            }else{
                income = self.salary!
            }
        }
        return income
    }
    
    func raise(percent : Double?){
        var newIncome : Double = 0
        if(title == nil || salary == nil || salaryType == nil || percent == nil){
            print("Incorrect input!")
        }else{
            newIncome = salary! * (1 + percent!)
            salary = newIncome;
        }
    }
}