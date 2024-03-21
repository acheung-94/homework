json.gifts do
    @gifts.each do |gift|
        json.set! gift.id do
            json.id gift.id
            json.title gift.title
            json.description gift.description
            json.partyId gift.party_id
            json.guestId gift.guest_id
        end
    end
end