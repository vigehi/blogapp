require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Edith Oga', photo: 'https://imgv3.fotor.com/images/homepage-feature-card/Fotor-AI-photo-enhancement-tool.jpg', bio: 'I am asoftware dev', posts_counter: 5) }

  it 'It will displayed to each user 3 posts limit' do
    expect(subject.posts_counter).to eql(5)
  end
end
