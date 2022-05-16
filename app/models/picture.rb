class Picture < ApplicationRecord
    belongs_to :imageable, polymorphic: true
    has_many_attached :pictures
end
