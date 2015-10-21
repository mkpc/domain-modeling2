protocol Mathematics {
    mutating func add(money2 : Money)
    mutating func sub(money2 : Money)
}

extension Double{
    var USD: Money { return Money( amount: self , currency: "USD")}
    var EUR: Money { return Money( amount: self , currency: "EUR")}
    var GBP: Money { return Money( amount: self , currency: "GBP")}
    var YEN: Money { return Money( amount: self , currency: "YEN")}
}

struct Money : CustomStringConvertible, Mathematics{
    var amount : Double?
    var currency : String?
    init (amount : Double?, currency : String?){
        if(amount == nil || currency == nil){
            self.amount = -0.00
            self.currency = "USD"
            printResult("init", success: false)
        }else{
            self.amount = amount
            self.currency = currency
            
        }
    }
    
    var description : String {
        return ("\(self.currency!) \(self.amount!)")
    }
    
    mutating func add(money2 : Money){
        var money2 = money2
        var newAmount : Double
        if(money2.currency == currency){
        }else{
            money2.convert(currency)
        }
        newAmount = Double(amount! + money2.amount!)
        amount = newAmount
    }
    
    mutating func sub(money2: Money) {
        var money2 = money2
        var newAmount : Double
        if(money2.currency == currency){
        }else{
            money2.convert(currency)
        }
        newAmount = Double(amount! - money2.amount!)
        amount = newAmount
    }
    
    mutating func convert(targetCurrency : String?){
        var amountInTargetCurrency : Double = 0
        if(amount == nil || currency == nil || targetCurrency == nil ){
            printResult("Convert function", success: false)
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
            printResult("Convert fucntion",success: true)
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
var moneyTest1 = Money (amount : 100.00 , currency : "USD")
moneyTest1.description


