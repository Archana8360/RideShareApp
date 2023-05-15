class Ride < ApplicationRecord
    reverse_geocoded_by :source_lat, :source_long,address: :source
    reverse_geocoded_by :destination_lat, :destination_long,address: :destination
    has_one :user
    has_one :vehicle 
    
end
