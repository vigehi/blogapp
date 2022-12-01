require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Hello Rails', text: 'I love rails', commentsCounter: 4, likesCounter: 8) }

  before { subject.save }

  it 'The title should but it gives nil be present' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'The title should be maximum at 250 character' do
    subject.title = 'a' * 300
    expect(subject).to_not be_valid
  end

  it 'Comments counter should be valid value integer and greater than zero' do
    subject.commentsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'likes counter should be valid value integer and greater than zero' do
    subject.likesCounter = -5
    expect(subject).to_not be_valid
  end

  it 'It will displayed to each user 5 comments limit' do
    expect(subject.commentsCounter).to eql(4)
  end

  it 'It will displayed to each user 8 likes limit' do
    expect(subject.likesCounter).to eql(8)
  end
end
