class Organisation < ApplicationRecord
    has_many :users
    has_many :evaluations
end
