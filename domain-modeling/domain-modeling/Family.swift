//
//  Family.swift
//  domain-modeling
//
//  Created by marco cheng on 10/15/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation

class Family : CustomStringConvertible{
    var members : [Person]?
    
    
    init (members :  [Person]?){
        if(members == nil){
            print("Nil object found, cannot process.")
        }else{
            self.members = members
        }
    }
    
    var description : String {
        let count = members!.count
        return ("This famaily have \(count) member")
    }
    
    
    //return the combined income of the entire family
    func householdIncome()->Double{
        var totalIncome : Double = 0
        for member in members!{
            if(member.job !== nil){
                if(member.job!.salaryType=="per-hour"){
                    totalIncome += member.job!.calculateIncome(2000)
                }else{
                    totalIncome += (member.job?.salary)!
                }
            }
            
        }
        return totalIncome
    }
    
    //there must be one Person in the family who is over age 21 to be legal
    func haveChild(baby : Person){
        for member in members!{
            if(member.age > 21){
                members?.append(baby)
                print("Now \(baby.firstName!) is in your family")
                break
            }else{
                print("No one over 21, can't let you have a baby")
            }
        }
        
    }
}