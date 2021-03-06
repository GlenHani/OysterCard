class Oystercard
  attr_reader :balance, :journey_log

  DEFAULT_BALANCE = 0
  MINIMUM_FARE = 1
  MAXIMUM_BALANCE = 90
  PENALTY_FARE = 6

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @journey = Journey.new
    @journey_log = JourneyLog.new
  end

  def top_up(amount)
    raise 'Oystercard has reached the limit' if exceed?(amount)
    add(amount)
  end

  def touch_in(station = nil)
    raise "Sorry insufficient funds available" if insufficient_funds?
    touch_in_penalty?
    @journey_log.begin_journey(station)
  end

  def touch_out(station = nil)
    penalty_or_fare?
    @journey_log.finish_journey(station)
  end

  private

  def exceed?(value)
    @balance + value > MAXIMUM_BALANCE
  end

  def insufficient_funds?
    @balance < MINIMUM_FARE
  end

  def deduct(travel)
    @balance -= travel
  end

  def add(amount)
    @balance += amount
  end

  def in_journey?
    @journey_log.in_journey
  end

  def touch_in_penalty?
    deduct(PENALTY_FARE) if in_journey?
  end

  def penalty_or_fare?
    in_journey? ? deduct(MINIMUM_FARE) : deduct(PENALTY_FARE)
  end
end