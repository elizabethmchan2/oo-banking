require_relative 'transfer'
class BankAccount
    attr_reader :name, :status
    attr_accessor :balance, :status
    
    def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
    end
    
    def deposit(amount)
        @balance = amount + @balance
    end
    
    def display_balance
        "Your Balance is $#{balance}."
    end 
    
    def valid?
        if @balance <= 0
            false
        elsif @status == "closed"
            false
        else
            true
        end
    end
    
    def close_account
        @status = "closed"
    end
    
end

acc1 = BankAccount.new("marley")
acc2 = BankAccount.new("other")
t1 = Transfer.new(acc1, acc2, 10000)

puts t1.execute_transaction