require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'The number of likes will increased by one ' do
    user = User.new(name:  'Edith oga', bio: 'Hello my name is oga I am 23 years old', postsCounter: 5)
    user.save

    post = Post.new(title: 'Hello Rails', text: 'I love rails', commentsCounter: 4, likesounter: 8,
                    author_id: user.id)
    post.save

    like = Like.new(author_id: user.id, post_id: post.id)
    like.save

    expect(like.post.likesCounter).to eql(9)
  end
end
