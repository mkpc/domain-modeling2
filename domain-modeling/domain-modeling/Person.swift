//
//  Person.swift
//  domain-modeling
//
//  Created by marco cheng on 10/15/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//


import Foundation

class Person : CustomStringConvertible{
    var firstName : String?
    var lastName : String?
    var age : Int?
    var job : Job?
    var spouse : Person?
    
    init (firstName : String?, lastName : String?, age : Int?){
        
        if(firstName == nil || lastName == nil || age == nil){
            print("This Person class contains nil property.")
        }else{
            self.firstName = firstName
            self.lastName = lastName
            self.age = age
        }
    }
    
    var description : String {
        return ("\(firstName!) \(lastName!) is \(age!) years old")
    }
    
    func addJob(job : Job?){
        if(age < 16){
            print("Too young to work.")
        } else{
            self.job = job
            print("have a job now.")
        }
    }
    
    func addSpouse(spouse : Person){
        if(self.age < 18){
            print("Too young to have spouse")
        }else{
            self.spouse = spouse
            print("Congratulations!")
        }
    }
    
    func toString()->String{
        var representation : String
        if(firstName == nil || lastName == nil || age == nil){
            return "found nil!"
        }else{
            representation = "\(firstName!) \(lastName!) is \(age!) year old"
            
            if(job !== nil){
                representation += " and work as \(job!.title!) for \(job!.salary!) \(job!.salaryType!)."
            }else{
                representation += " and no have job currently."
            }
            
            if spouse == nil {
                representation += " No spouse at the moment."
            }else {
                representation += " Has spouse call \(spouse!.firstName!) \(spouse!.lastName!)."
            }
            return representation
        }
    }
}