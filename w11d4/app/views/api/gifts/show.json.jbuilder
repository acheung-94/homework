json.extract! @gift, :title, :description
json.guest @gift.guest.name
json.party @gift.party.name