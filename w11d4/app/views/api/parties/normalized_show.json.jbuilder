json.parties do

    json.set! @party.id do
        json.id @party.id
        json.name @party.name
        json.location @party.location
        json.extract! @party, :guest_ids, :gift_ids
    end

end

json.guests do
    @party.guests.each do |guest|
        json.set! guest.id do
            json.id guest.id
            json.name guest.name
            json.age guest.age
            json.favorite_color guest.favorite_color
            json.gift_ids guest.gifts.map(&:id)
        end
    end
end

json.gifts do
    @party.gifts.each do |gift|
        json.set! gift.id do
            json.id gift.id
            json.title gift.title
            json.description gift.description
            json.partyId gift.party_id
            json.guestId gift.guest_id
        end
    end
end