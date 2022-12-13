# require 'rails_helper'

# RSpec.describe 'Index page', type: :system, js: true do
#   before :each do
#     User.create(id: 35, name: 'Edith', bio: 'hello there', photo: 'none',
#                 password: '12345678', email: 'edith@gmail.com', posts_counter: 4, confirmed_at: Time.now)
#     visit new_user_session_path
#     fill_in 'Email', with: 'edith@gmail.com'
#     fill_in 'Password', with: '12345678'
#     click_button('Log in')
#     visit users_path
#   end

#   describe 'index page for list users' do
#     it 'I can see the username of all other users.' do
#       expect(page).to have_content('Edith')
#     end

#     it 'I can see the number of posts each user has written..' do
#       expect(page).to have_content('number of posts: 4')
#     end

#     it "I can see the user's bio.." do
#       expect(page).to have_content('hello there')
#     end

#     it "I can see the user's first 3 posts." do
#       expect(page).to have_content('This is my first test')
#       expect(page).to have_content('This is my second test')
#       expect(page).to have_content('This is my third test')
#     end

#     it "I can see a button that lets me view all of a user's posts." do
#       expect(page).to have_content('See all posts')
#     end

#     it "When I click a user's post, it redirects me to that post's show page.." do
#       click_link 'Hello1'
#       expect(page.current_path).to have_content('/users/42/posts/14')
#     end

#     it "When I click to see all posts, it redirects me to the user's post's index page." do
#       click_link 'See all posts'
#       expect(page.current_path).to have_content('/users/42/posts')
#     end
#   end
# end
require 'rails_helper'
require 'capybara'
require_relative '../config/environment'

RSpec.describe 'show all users', type: :feature do
  let!(:users) do
    User.all
  end

  context 'visit /users' do
    before(:example) do
      visit users_path
    end

    it 'I can see the profile picture for each user.' do
      users.each do |user|
        expect(page).to have_css("img[src*='#{user.photo}']")
      end
    end

    it 'I can see the number of posts each user has written.' do
      users.each do |user|
        expect(page.find("#user_id_#{user.id}")).to have_content "Number of posts: #{user.posts_counter}"
      end
    end

    describe 'GET #index' do
      it 'I can see the username of all other users'
      expect(page).to have_content('user.name')
    end

    describre 'GET #index' do
      it 'I can see the profile picture for each user.'
      expect(page).to have_content('user.photo')
    end

    describe 'GET #index' do
      it 'I can see the number of posts each user has written.'
      expect(page).to have_content('user.posts_counter')
    end

    describe 'GET #index' do
      it 'I can see the title of each post.'
      expect(page).to have_content('post.title')
    end

    describe 'GET #index' do
      it 'that redirects to the users show page when you click on a user'
      expect(page).to have_content('user_path')
    end
  end
end
