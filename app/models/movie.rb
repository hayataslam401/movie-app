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
    #scope :with_positive_reviews, -> { where(id: Review.pluck(:movie_id)) }
    scope :with_positive_reviews, -> { Movie.eager_load(:reviews).where.not("reviews.movie_id" => nil) }
    scope :movie_search , -> (title2) { where("title LIKE?","%#{title2}%") }
    acts_as_list
end
