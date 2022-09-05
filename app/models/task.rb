class Task < ApplicationRecord
    validates :description, presence: true
    validates :done, inclusion: [true, false]
end
