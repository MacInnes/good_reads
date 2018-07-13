require 'rails_helper'

describe Book do
  describe 'Methods' do
    it 'can average all reviews' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      expected = 4

      expect(book_1.average_rating).to eq(expected)
    end
    it 'can find the highest rating' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      expected = review_1.rating

      expect(book_1.highest_rating.rating).to eq(expected)
    end
    it 'can find the lowest rating' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      expected = review_3.rating

      expect(book_1.lowest_rating.rating).to eq(expected)
    end
  end
end
