//
//  MoneyExtension.swift
//  domain-modeling
//
//  Created by Marco Cheng on 10/20/15.
//  Copyright © 2015 marco cheng. All rights reserved.
//

import Foundation

extension Double{
    var USD: Money { return Money( amount: self , currency: "USD")}
    var EUR: Money { return Money( amount: self , currency: "EUR")}
    var GBP: Money { return Money( amount: self , currency: "GBP")}
    var YEN: Money { return Money( amount: self , currency: "YEN")}
}