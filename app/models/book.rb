class Book < ApplicationRecord
  has_many :reviews

  # I feel like there's a better way to do these, feedback is welcome:

  def average_rating
    total = 0
    reviews.each do |review|
      total += review.rating
    end
    total / reviews.length
  end

  def highest_rating
    reviews.max_by do |review|
      review.rating
    end
  end

  def lowest_rating
    reviews.min_by do |review|
      review.rating
    end
  end
end
