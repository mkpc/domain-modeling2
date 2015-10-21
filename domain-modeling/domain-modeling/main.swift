//
//  main.swift
//  domain-modeling
//
//  Created by marco cheng on 10/14/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation

print("////////////Test for money/////////////////")
var money1 = Money(amount : 100.00 , currency : "CAN")
var money2 = Money (amount : 100.00, currency : "GBP")
print("Money1 = \(money1.amount!) in \(money1.currency!)")
print("Money2 = \(money2.amount!) in \(money2.currency!)")
print("")
print("Convert \(money1.amount!) in \(money1.currency!) to 'GBP'")
money1.convert("GBP")
print("Money1 now is \(money1.amount!) in \(money1.currency!)")
print("")
print("Adding \(money1.amount!) in \(money1.currency!) and \(money2.amount!) in \(money2.currency!)")
money1.add("USD", secondMoney: money2)
print("Money1 now is \(money1.amount!) in \(money1.currency!)")
print("")
print("/////////////////////////////////////////////")
print("////////////Test for Job/////////////////////")
var cleanJob = Job(title: "Cleaner", salary: 17.00, salaryType: "per-hour")
var betterJob = Job(title: "teacher", salary: 50000.00, salaryType: "per-year")
print("Assigned two jobs :")
print("")
print("Job title = \(cleanJob.title)")
print("   salary = \(cleanJob.salary)")
print("   salaryType = \(cleanJob.salaryType)")
print("")
print("Job title = \(betterJob.title)")
print("   salary = \(betterJob.salary)")
print("   salaryType = \(betterJob.salaryType)")
print("")
print("Work 40 hours \(cleanJob.title) :  \(cleanJob.calculateIncome(40.0))")
print("")
print("Work 40 hours \(betterJob.title) : \(betterJob.calculateIncome(40.0))")
print("")
cleanJob.raise(0.7)
print("Raise \(cleanJob.title) salary by 70% to \(cleanJob.salary)")
print("/////////////////////////////////////////////")
print("////////////Test for Person//////////////////")
var peterC = Person(firstName: "Peter", lastName: "Cho", age: 29)
var maryK = Person(firstName: "Mary", lastName: "K", age: 25)
var billA = Person(firstName: "Bill", lastName: "A", age: 12)
var tomB = Person(firstName: "Tom", lastName: "B", age: 0)
print(peterC.toString())
print("")
print(peterC.addJob(betterJob))
print(peterC.toString())
print("")
print(peterC.addSpouse(maryK))
print(peterC.toString())
print("")
print(billA.toString())
print("")
print(billA.addSpouse(maryK))
print("/////////////////////////////////////////////")
print("////////////Test for Family//////////////////")
var peopleArr : [Person]? = [peterC,maryK,billA]
var family = Family( members : peopleArr)
print("")
family.haveChild(tomB)
print("")
print("household Income : \(family.householdIncome())")
maryK.addJob(cleanJob)
print("household Income : \(family.householdIncome())")
print("")

print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")
print("///////////Unit Test start here//////////////")
print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")
print("/////////////////////////////////////////////")


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

print("1) Should match the expected money")
moneyTest1.convert("GBP")
print("    Amount test 1: \(checkMoneyConvert(moneyTest1, expectedMoney: expectedMoney))")
print("")
print("2) Should match the expected money")
moneyTest2.convert("USD")
print("    Test2 : \(checkMoneyConvert(moneyTest2, expectedMoney: expectedMoney2))")
print("")

var testJob1 = Job(title: "Cleaner", salary: 10.00, salaryType: "per-hour")
var testJob2 = Job(title: "teacher", salary: 50000.00, salaryType: "per-year")
var testJob3 = Job(title: "teacher", salary: nil, salaryType: "per-year")
var testJob4 = Job(title: nil, salary: 50000.00, salaryType: "per-year")
var testJob5 = Job(title: "teacher", salary: 50000.00, salaryType: nil)
var expectedJobSalary1 : Double = 400.00
var expectedJobSalary2 : Double = 15.00
var expectedJobSalary3 : Double = 75000.00
var expectedErrorMsg : String = "ERROR : Salary type is not per-hour"

print("")
print("5) Should match the expected money")
print(testJob1.calculateIncome(40) == expectedJobSalary1)
print("")
print("6) Should match the expected money")
print(testJob2.calculateIncome(40) == 50000.00)
print("")
print("7) Should expect income == 0.0 and Error message")
print(testJob3.calculateIncome(40) == 0.0)
print("")
print("8) Should expect income == 0.0 and Error message")
print(testJob4.calculateIncome(40) == 0.0)
print("")
print("8) Should expect income == 0.0 and Error message")
print(testJob5.calculateIncome(40) == 0.0)
print("")
print("9) Should match the expected money")
testJob1.raise(0.5)
print(testJob1.salary == expectedJobSalary2)
print("")
print("10) Should match the expected money")
testJob2.raise(0.5)
print(testJob2.salary == expectedJobSalary3)
print("")

var testPerson1 = Person(firstName: "test1", lastName: "Person1", age: 29)
var testPerson2 = Person(firstName: "test2", lastName: "Person2", age: 25)
var testPerson3 = Person(firstName: "test3", lastName: "Person3", age: 12)
var testPerson4 = Person(firstName: "test4", lastName: "Person4", age: 15)
var testPerson5 = Person(firstName: "test5", lastName: "Person5", age: 17)
var testPerson6 = Person(firstName: "test6", lastName: "Person6", age: 0)
var expectedTestPersonString = "test1 Person1 is 29 year old and no have job currently. No spouse at the moment."
var expectedTestPersonString2 = "test1 Person1 is 29 year old and work as Cleaner for 15.0 per-hour. No spouse at the moment."
var expectedTotalIncome = 60000.0
var expectedTotalIncome2 = 90000.0

print("11) Should match the expected string")
print(testPerson1.toString() == expectedTestPersonString)
print("")
print("12) Should have a job and match the expected string")
testPerson1.addJob(testJob1)
testPerson2.addJob(testJob1)
print(testPerson1.toString() == expectedTestPersonString2)
print("")
print("13) Should not have a job and throw Error Msg")
testPerson3.addJob(testJob1)
print("")
print("14) Should not have a spouse and throw Error Msg")
testPerson3.addSpouse(testPerson4)
print("")

var testPeopleArr : [Person]? = [testPerson1,testPerson2,testPerson3]
var testFamily = Family( members : testPeopleArr)
print("15) Should matched the expected total income")
print(testFamily.householdIncome() == expectedTotalIncome)
print("")
print("15) Should matched the expected total income")
testJob1.raise(0.5)
print(testFamily.householdIncome() == expectedTotalIncome2)
print("")
print("16) Should allow to have a child")
testFamily.haveChild(testPerson6)
print("")
print("")
print("")
print("")
print("Test for the protocol")
print("")
print("17) Money should be match expected amount")
var moneyTest10 = Money (amount : 100.00 , currency : "USD")
var moneyTest10expected = "USD 100.0"
print (moneyTest10.description == moneyTest10expected)
print("")
var moneyTest11 = Money (amount : 100.00 , currency : "USD")
var moneyTest11expected = "USD 100.0"
print("18) Money description should match expected description")
print (moneyTest11.description == moneyTest11expected)
print("")
var jobTest = Job(title: "Cleaner", salary: 10.00, salaryType: "per-hour")
var jobTestExpected = "The salary of Cleaner is $10.0 per-hour"
print("19) Job description should match expected description")
print(jobTest.description == jobTestExpected)
print("")
print("20) Person description should match expected description")
var personTest = Person(firstName: "peter", lastName: "cho", age: 12)
var jobTestExpected1 = "peter cho is 12 years old"
print(personTest.description == jobTestExpected1)
print("")
print("21) Family description should match expected description")
var familyExpected = "This famaily have 4 member"
print(family.description == familyExpected)
print("")
print("22) Add: Money should match expected amount")
var newMoney1 = Money(amount: 10.00, currency: "USD")
var newMoney2 = Money(amount: 20.00, currency: "GBP")
var expectedMoney1 = Money(amount: 50, currency: "USD")
var expectedMoney11 = Money(amount: 10, currency: "USD")
newMoney1.add(newMoney2)
print(checkMoneyConvert(newMoney1, expectedMoney: expectedMoney1))
print("")
print("23) Sub: Money should match expected amount")
newMoney1.sub(newMoney2)
newMoney1.description
print(checkMoneyConvert(newMoney1, expectedMoney: expectedMoney11))
print("")
print("24) Double Ext: The double should match the expected money object")
var expectedMoneyTest = Money(amount: 20.00, currency: "USD")
var newMoneyUSD = 20.00
print(newMoneyUSD.USD.amount == expectedMoneyTest.amount && newMoneyUSD.USD.currency == expectedMoneyTest.currency)




