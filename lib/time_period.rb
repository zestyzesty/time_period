require "time_period/version"
require "active_support"
require "active_support/core_ext"

class TimePeriod
  attr_reader :beginning, :ending

  def self.duration
    const_get(:DURATION) || raise("must define a duration")
  end

  def self.this(now: Time.zone.now)
    new(now)
  end

  def self.relative(n)
    n = n.to_i
    relative_duration = (n.abs * duration)
    relative_method = n.positive? ? :since : :ago

    new(relative_duration.send(relative_method, Time.zone.now))
  end

  def self.next
    relative(1)
  end

  def self.last
    relative(-1)
  end

  def initialize(beginning)
    @beginning = beginning.to_date
    @ending = self.class.duration.since(@beginning)
  end

  def eql?(other)
    self.class.eql?(other.class) && beginning.eql?(other.beginning)
  end
  alias == eql?
end
