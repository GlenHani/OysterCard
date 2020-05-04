class OysterCard

    MAXIMUM_BALANCE = 90

    attr_accessor :balance

    def initialize (balance = 0)
      @balance = balance
    end

    def top_up(amount)
        fail 'Maximum balance of 90 exceeded' if amount + balance > MAXIMUM_BALANCE
        @balance += amount
    end


  end
