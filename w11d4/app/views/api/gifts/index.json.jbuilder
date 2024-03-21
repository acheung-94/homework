json.array! @gifts do |gift|
    json.extract! gift, :title, :description
    json.party gift.party.name
end