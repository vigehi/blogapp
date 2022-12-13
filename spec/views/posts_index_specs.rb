# require 'rails_helper'

# RSpec.describe 'Posts index', type: :system, js: true do
#   before :each do
#     @test = User.create(id: 42, name: 'Andy', bio: 'hello there', photo: 'none',
#                         password: '123456', email: 'andy@gmail.com', posts_counter: 4, confirmed_at: Time.now)

#     @test1 = Post.create(id: 14, author_id: 42, comments_counter: 2, likes_counter: 5,
#                          title: 'Hello1', text: 'This is my first test', created_at: Time.now)

#     @test2 = Post.create(id: 15, author_id: 42, comments_counter: 0, likes_counter: 5,
#                          title: 'Hello2', text: 'This is my second test', created_at: Time.now)

#     @test3 = Post.create(id: 16, author_id: 42, comments_counter: 0, likes_counter: 5,
#                          title: 'Hello3', text: 'This is my third test', created_at: Time.now)
#     @comment1 = Comment.create(id: 20, text: 'Beautiful!', author_id: 14)
#     @comment2 = Comment.create(id: 21, text: 'very good!', author_id: 14)
#     @comment3 = Comment.create(id: 22, text: 'very good!', author_id: 14)
#     @comment4 = Comment.create(id: 23, text: 'very good!', author_id: 14)

#     @like1 = Like.create(id: 85, author_id: 42, post_id: 15)
#     @like2 = Like.create(id: 86, author_id: 42, post_id: 15)

#     visit new_user_session_path
#     fill_in 'Email', with: 'andy@gmail.com'
#     fill_in 'Password', with: '123456'
#     click_button 'Log in'
#     click_link 'Andy'
#     click_link 'test1'
#     click_on 'see all posts'
#   end

#   describe 'index page for all posts with comments to one user' do
#     it "I can see the user's profile picture." do
#       expect(page).to have_content('img')
#     end

#     it "I can see the user's username." do
#       expect(page).to have_content('Andy')
#     end

#     it 'I can see the number of posts the user has written.' do
#       expect(page).to have_content('number of posts: 3')
#     end

#     it "I can see a post's title." do
#       expect(page).to have_content('hello1')
#     end

#     it "I can see some of the post's body." do
#       expect(page).to have_content('This is my first test')
#     end

#     it 'I can see the first comments on a post.' do
#       expect(page).to have_content('Beautiful!')
#     end

#     it 'I can see how many comments a post has.' do
#       expect(page).to have_content('comments: 4')
#     end

#     it 'I can see how many likes a post has.' do
#       expect(page).to have_content('likes: 2')
#     end

#     it "When I click on a post, it redirects me to that post's show page." do
#       click_on 'test1'
#       expect(page).to have_content('/users/42/posts/14')
#     end
#   end
# end
require 'rails_helper'

RSpec.describe 'Posts Index', type: :request do
  before(:each) do # rubocop:disable Metrics/BlockLength
    @user = User.create(
      name: 'Andy Menutti',
      bio: 'Software Engineer / Sr.Sound Designer',
      photo: 'https://shorturl.at/nJVX7',
      post_counter: 0
    )

    @post1 = Post.create(
      author_id: @user.id,
      title: 'This is my first post',
      text: 'This is the content of my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    @post2 = Post.create(
      author_id: @user.id,
      title: 'This is my second post',
      text: 'This is the content of my second post',
      comments_counter: 0,
      likes_counter: 0
    )
    @post3 =
      Post.create(
        author_id: @user.id,
        title: 'This is my third post',
        text: 'This is the content of my third post',
        comments_counter: 0,
        likes_counter: 0
      )
    @post4 =
      Post.create(
        author_id: @user.id,
        title: 'This is my fourth post',
        text: 'This is the content of my fourth post',
        comments_counter: 0,
        likes_counter: 0
      )
  end

  describe 'GET #index' do
    it 'returns http success' do
      get users_path
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #users' do
    it 'returns http success' do
      get users_path(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #index' do
    it 'you can see the users profile picture.'
    expect(page).to have_content('user.photo')
  end

  describe 'GET #index' do
    it 'you can see the users username'
    expect(page).to have_content('user.name')
  end

  describe 'GET #index' do
    it 'you can see the number of posts the user has written'
    expect(page).to have_content('user.post_counter')
  end

  describe 'GET #index' do
    it 'you can see a posts title'
    expect(page).to have_content('post.title')
  end

  describe 'GET #index' do
    it ' you can see some of the posts body'
    expect(page).to have_content('post.text')
  end

  describe 'GET #index' do
    it 'you can see the first comments on a post'
    expect(page).to have_content('post.comment.first')
  end

  describe 'GET #index' do
    it 'can see how many likes each post has' do
      expect(page).to have_content('post.likes_counter')
    end
  end

  describe 'GET #index' do
    it 'can see the post content' do
      expect(page).to have_content('post.content')
    end
  end

  describe 'GET #index' do
    it 'can see the username of each commentor' do
      post.comment.each do |_comment|
        expect(page).to have_content('comment.user.name')
      end
    end
  end

  describe 'GET #index' do
    it 'that asserts you can see how many comments a post has' do
      expect(page).to have_content('post.comments_counter')
    end
  end

  describe 'GET #index' do
    it 'can see the first comments on a post.' do
      expect(page).to have_content('post.comment.first')
    end
  end

  describe 'GET #index' do
    it 'can see the content of each comment left' do
      post.comment.each do |_comment|
        expect(page).to have_content('comment.text')
      end
    end
  end

  describe 'GET #index' do
    it 'can see the number of likes each comment has' do
      post.comment.each do |_comment|
        expect(page).to have_content('comment.likes_counter')
      end
    end
  end

  describe 'GET #index' do
    it 'can see the number of post with likes' do
      expect(page).to have_content('post.likes_counter')
    end
  end

  describe 'GET #index' do
    it 'can see a section for pagination if there are more posts than fit on the view' do
      expect(page).to have_content('post.pagination')
    end
  end

  describe 'GET #index' do
    it 'redirects to the posts show page when you click on a post' do
      expect(page).to have_content('post_path')
    end
  end
end
