require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'The number of comments will increased by one ' do
    user = User.new(name: 'Edith oga', bio: 'Hello my name is oga I am 23 years old', postsCounter: 5)
    user.save

    post = Post.new(title: 'Hello Rails', text: 'I love rails', commentsCounter: 4, likes_counter: 8,
                    author_id: user.id)
    post.save

    comment = Comment.new(author_id: user.id, post_id: post.id)
    comment.save

    expect(comment.post.commentsCounter).to eql(5)
  end
end
