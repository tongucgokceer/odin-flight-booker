class Booking < ApplicationRecord
    belongs_to :flight
    has_many :passengers
    validates_presence_of :passengers

    accepts_nested_attributes_for :passengers,
        allow_destroy: true,
        reject_if: proc { |attributes| attributes['name'].blank? || attributes['email'].blank?}

end


