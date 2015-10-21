//: Playground - noun: a place where people can play

import Cocoa
//
//  Money.swift
//  domain-modeling
//
//  Created by marco cheng on 10/15/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation
//
//  Money.swift
//  domain-modeling
//
//  Created by marco cheng on 10/15/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation

struct Money{
    var amount : Double?
    var currency : String?
    
    init (amount : Double?, currency : String?){
        self.amount = amount
        self.currency = currency
    }
    
    mutating func convert(targetCurrency : String?)->String{
        var amountInTargetCurrency : Double = 0
        if(amount == nil || currency == nil || targetCurrency == nil ){
            return printResult("Convert function", success: false)
        }else{
            if(self.currency! == "USD"){
                switch targetCurrency!{
                case "USD" : amountInTargetCurrency = self.amount!
                case "GBP" : amountInTargetCurrency =  self.amount! * 0.5
                case "EUR" : amountInTargetCurrency = self.amount! * 1.5
                case "CAN" : amountInTargetCurrency = self.amount! * 1.25
                default :  print("Unexpected Currency")
                }
            }else if(self.currency! == "GBP"){
                switch targetCurrency!{
                case "USD" : amountInTargetCurrency = self.amount! * 2.0
                case "GBP" : amountInTargetCurrency =  self.amount!
                case "EUR" : amountInTargetCurrency = self.amount! * 3.0
                case "CAN" : amountInTargetCurrency = self.amount! * 2.5
                default :  print("Unexpected Currency")
                }
            }else if(self.currency! == "EUR"){
                switch targetCurrency!{
                case "USD" : amountInTargetCurrency = self.amount!  * 1/1.5
                case "GBP" : amountInTargetCurrency =  self.amount! * 1.0/3.0
                case "EUR" : amountInTargetCurrency = self.amount!
                case "CAN" : amountInTargetCurrency = self.amount! * 1.25/1.5
                default :  print("Unexpected Currency")
                }
            }else if(self.currency! == "CAN"){
                switch targetCurrency!{
                case "USD" : amountInTargetCurrency = self.amount! * 1/1.25
                case "GBP" : amountInTargetCurrency =  self.amount! * 1/2.5
                case "EUR" : amountInTargetCurrency = self.amount! * 1.5/1.25
                case "CAN" : amountInTargetCurrency = self.amount!
                default :  print("Unexpected Currency")
                }
            }
            self.currency = targetCurrency
            self.amount = amountInTargetCurrency
            return printResult("Convert fucntion",success: true)
        }
    }
    
    mutating func add(targetCurrency : String?, var secondMoney : Money?)->String{
        if(amount == nil || currency == nil || targetCurrency == nil || secondMoney!.amount == nil || secondMoney!.currency == nil ){
            return printResult("Add fucntion", success: false)
        }
        self.convert(targetCurrency!)
        secondMoney!.convert(targetCurrency!)
        self.currency = targetCurrency
        self.amount = self.amount! + (secondMoney?.amount!)!
        return printResult("Add fucntion",success: true)
    }
    
    mutating func sub(targetCurrency : String?, var secondMoney : Money?)->String{
        if(amount == nil || currency == nil || targetCurrency == nil || secondMoney!.amount == nil || secondMoney!.currency == nil ){
            return printResult("Sub fucntion",success: false)
        }
        self.convert(targetCurrency!)
        secondMoney!.convert(targetCurrency!)
        self.currency = targetCurrency
        self.amount = self.amount! - (secondMoney?.amount!)!
        return printResult("Sub fucntion",success: true)
    }
    
    mutating func printResult(functionName : String, success : Bool)->String{
        if success{
            return "\(functionName) : Money updated \(amount!) in \(currency!)"
        }else{
            return  "\(functionName) : Money not updated, please check input"
        }
    }
}


func checkMoneyConvert(money :Money, expectedMoney : Money?)->Bool{
    return money.amount == expectedMoney!.amount && money.currency == expectedMoney!.currency
}

func checkMoneyConvertString(testMsg : String, expectedMsg : String)->Bool{
    
    return testMsg == expectedMsg
}

var moneyTest1 = Money (amount : 100.00 , currency : "USD")
var expectedMsg = "Convert function : Money not updated, please check input"
var expectedMoney = Money (amount: 50.00, currency : "GBP")
var moneyTest2 = Money (amount : 100.00 , currency : "GBP")
var expectedMoney2 = Money (amount: 200.00, currency : "USD")
var moneyTest3 = Money (amount : nil , currency : "GBP")
var expectedMoney3 = Money (amount: nil, currency : "USD")

var moneyTest4 = Money (amount : 100.00 , currency : "GBP")
var moneyTest5 = Money (amount : 100.00 , currency : "USD")
var expectedMoney4 = Money (amount: 300.00, currency : "USD")

print("///////Money test 1 (100 USD -> 50 GBP)///////")
moneyTest1.convert("GBP")
print("Amount test 1: \(checkMoneyConvert(moneyTest1, expectedMoney: expectedMoney))")


print("///////Money test 2 (100 GBP -> 200 USD)///////")
moneyTest2.convert("USD")
print("Test2 : \(checkMoneyConvert(moneyTest2, expectedMoney: expectedMoney2))")

print("///////  Money test 3 (nil USD)  ///////")
print("Should return Error msg")
print(checkMoneyConvertString(moneyTest3.convert("USD"),expectedMsg : expectedMsg))

moneyTest4.add("USD", secondMoney: moneyTest5)
print("///////  Money test 3 (100 GBP + 100 USD = 300 USD)  ///////")
print("Should match the expected money")
print(checkMoneyConvert(moneyTest4,expectedMoney : expectedMoney4))







