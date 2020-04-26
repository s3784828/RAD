class Student < ApplicationRecord
    has_many :awards, dependant: :destroy

    def name
        given_name + " " + family_name
    end

end
