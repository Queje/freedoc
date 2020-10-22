class Specialty < ApplicationRecord
    has_many :doctors, through: :doctors_by_specialties
end
