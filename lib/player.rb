class Player
    attr_reader :name, :hp

    def initialize(name, hp)
        @name = name
        @hp = hp
    end

    def take_hit(damage)
        @hp -= damage
    end

    def attack(opponent, damage)
        opponent.take_hit(damage)
    end
    
end