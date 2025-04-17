class CharacterGateway
    def self.fetch_speed(race)
       return conn.get("/races/#{race}")["speed"]
    end

    private

    def self.conn 
        Faraday.new(url: "https://5e-bits.github.io/docs/api")
    end
end