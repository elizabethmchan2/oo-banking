class Transfer
    attr_reader :sender, :receiver, :amount, :done
    attr_accessor :status
    def initialize(sender, receiver, amount)
      @sender = sender
      @receiver = receiver
      @amount = amount
      @status = "pending"
      @done = false
    end
    def both_valid?
        if sender.valid? && receiver.valid?
            true
        else
            false
        end
    end
    def execute_transaction
        if @done == false
            @done = true
            if both_valid? && @sender.balance >= amount
                @status = "complete"
                @receiver.balance = receiver.balance + amount
                @sender.balance = sender.balance - amount
            else
                puts "hit"
                @status = "rejected"
                "Transaction rejected. Please check your account balance."
            end
        end
    end
    def reverse_transfer
        if @done == true
        @status = "reversed"
        @receiver.balance = receiver.balance - amount
        @sender.balance = sender.balance + amount
        end
    end
    
end

