json.guests do
    @guests.each do |guest|
        json.set! guest.id do
            json.id guest.id
            json.name guest.name
            json.age guest.age
            json.favorite_color
            json.giftIds guest.gifts.map(&:id)
        end
    end
end