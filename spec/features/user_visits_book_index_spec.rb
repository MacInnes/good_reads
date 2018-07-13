require 'rails_helper'

describe "User" do
  context 'visits book index page' do
    it 'sees all book titles in the database' do
      book_1 = Book.create(title: "asdfhkj")
      book_2 = Book.create(title: "jkhfsajk")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_2.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)


      visit books_path

      expect(page).to have_content(book_1.title)
      expect(page).to have_content(book_2.title)
    end
    it "can click a book's name to be sent to that book's show page" do
      book_1 = Book.create(title: "asdfhkj")
      book_2 = Book.create(title: "jkhfsajk")
      user_1 = User.create(name: "sdfjhasd")
      review_1 = book_1.reviews.create(body: "basfdhksfd", rating: 5, user_id: user_1.id)
      review_2 = book_1.reviews.create(body: "asdfjkfd", rating: 4, user_id: user_1.id)
      review_3 = book_2.reviews.create(body: "fgkjhasdf", rating: 3, user_id: user_1.id)

      visit books_path

      click_link(book_2.title)
      expect(current_path).to eq(book_path(book_2))
    end
  end
end
