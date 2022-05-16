class Movie < ApplicationRecord
    has_many :pictures, as: :imageable
    accepts_nested_attributes_for :pictures
    belongs_to :user
    has_many :reviews
    has_one_attached :image
    validates :title, presence: true
    validates :image, presence: true
    enum :status, [ :Action, :Thriller, :Comedy, :Suspense ]
    has_many :cast_members, dependent: :destroy
    accepts_nested_attributes_for :cast_members,  allow_destroy: true, reject_if: ->(attrs) { attrs['name'].blank?}
    enum :genre, [ :Draft, :Published, :Rejected ]
end
