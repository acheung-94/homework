json.extract! @guest, :name, :age, :favorite_color
json.gifts @guest.gifts do |gift|
    json.extract! gift, :title, :description
    json.party gift.party.name
end