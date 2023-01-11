class UserAccount {
    
    var accountBalance: Double {
        didSet { // It is used when we want run a piece of code after updating or assigning the new value to the property, It calls after willSet.
            print("didSet")
            sendMessageToUser()
        }
        
        willSet (newAccountBalance) { // It is used when we want run a piece of code before updating or assigning the new value to the property, It calls first.
            print("willSet")
            if newAccountBalance >= 10000000
            {
                sendMessageToAuditor()
            }
        }
    }
    
    init(_ openingBalance: Double) {
        self.accountBalance = openingBalance
    }
    
    func addMoney(amount: Double) {
        accountBalance += amount
    }
    
    func sendMessageToUser() {
        print("Account new balance is \(accountBalance)")
    }
    
    func sendMessageToAuditor() {
        print("Please check this account, and make sure the transaction is authentic")
    }
}

let newUser = UserAccount(4000)
newUser.addMoney(amount: 10000000)
