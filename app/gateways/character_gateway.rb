class CharacterGateway
    def self.fetch_speed(race)
       response = conn.get("/api/2014/races/#{race}")
       json = JSON.parse(response.body, symbolize_names: true)
       return json[:speed]
    end

    private

    def self.conn 
        Faraday.new(url: "https://www.dnd5eapi.co")
    end
end