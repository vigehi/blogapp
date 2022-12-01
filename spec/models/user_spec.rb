require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Edith oga', photo:
     'https://imgv3.fotor.com/images/homepage-feature-card/Fotor-AI-photo-enhancement-tool.jpg', bio: 'I am asoftware dev', postsCounter: 5) }

  before { subject.save }

  it 'The name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'The name should be present' do
    expect(subject).to be_valid
  end

  it 'Posts counter should be valid value integer and greater than zero' do
    subject.postsCounter = -5
    expect(subject).to_not be_valid
  end

  it 'Posts counter should be valid value integer and greater than zero' do
    expect(subject).to be_valid
  end

  it 'It will displayed to each user 3 posts limit' do
    expect(subject.postsCounter).to eql(5)
  end
end
