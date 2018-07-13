require 'rails_helper'

describe 'User' do
  context 'visits book show page' do
    it 'shows the title of the book' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      visit book_path(book_1)

      expect(page).to have_content(book_1.title)
    end
    it 'shows a list of reviews including rating' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      visit book_path(book_1)

      expect(page).to have_content(review_1.body)
      expect(page).to have_content(review_2.body)
      expect(page).to have_content(review_3.body)
      expect(page).to have_content(review_1.rating)
      expect(page).to have_content(review_2.rating)
      expect(page).to have_content(review_3.rating)
      expect(page).to have_content(review_1.user.name)
      expect(page).to have_content(review_2.user.name)
      expect(page).to have_content(review_3.user.name)
    end
    it 'shows the average rating for the book' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      expected = "Average rating: 4"

      visit book_path(book_1)

      expect(page).to have_content(expected)
    end
    it 'shows the highest rating for the book' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      expected = "Highest rating: 5"

      visit book_path(book_1)

      expect(page).to have_content(expected)
    end
    it 'also shows the review for the highest rating' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      visit book_path(book_1)

      within('.high-review') do
        expect(page).to have_content(review_1.body)
        expect(page).to have_content(review_1.user.name)
      end
    end
    it 'shows the lowest rating and associated review' do
      book_1 = Book.create(title: "asdfhkj")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_1.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      visit book_path(book_1)

      within('.low-review') do
        expect(page).to have_content(review_3.body)
        expect(page).to have_content(review_3.user.name)
      end
    end
  end
end
