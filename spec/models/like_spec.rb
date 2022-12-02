require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'The number of likes will increased by one ' do
    user = User.new(name: 'Edith Oga', bio: 'Hello my name is oga I am 22 years old', posts_counter: 5)


    post = Post.new(title: 'Hello Rails', text: 'I love rails', comments_counter: 4, likes_counter: 8,
                    author_id: user.id)


    like = Like.new(author_id: user.id, posts_id: post.id)


   
  end
end
