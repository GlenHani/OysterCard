class OysterCard
    attr_accessor :balance

    def initialize (balance = 0)
      @balance = balance
    end

    def top_up(amount)
      @balance = balance + amount
    end
  end
