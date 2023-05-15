class Vehicle < ApplicationRecord
    has_one :user
    has_many :ride
end
