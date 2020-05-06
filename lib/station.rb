
class Station
  def initialize(name, zone)
    @name = name
    @zone = zone

    def name
      @name = :name
    end

    def zone
      @zone = :zone
    end
  end
end
