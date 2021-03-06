class Oystercard

attr_accessor :balance
DEFAULT_BALANCE = 90
MINIMUM_FARE = 1

  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(amount)
    raise "Balance exceeds limit of £#{DEFAULT_BALANCE}" if (@balance + amount) > DEFAULT_BALANCE
    @balance += amount
  end

  def in_journey?
    @in_journey
  end

  def touch_in
    raise "Insufficient funds on card" if @balance < MINIMUM_FARE
    @in_journey = true
  end

  def touch_out
    @in_journey = false
    @balance -= MINIMUM_FARE
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
