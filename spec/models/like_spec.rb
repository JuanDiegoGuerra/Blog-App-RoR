require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:user) do
    User.create(name: 'JD', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Peru.')
  end

  let(:post) do
    Post.create(author: user, title: 'Hello', text: 'This is my first post')
  end

  let(:like) do
    Like.new(user:, post:)
  end
end
