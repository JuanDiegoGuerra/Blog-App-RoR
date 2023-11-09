require 'rails_helper'

RSpec.describe 'users/index', type: :system do
  describe 'index page' do
    let!(:user1) do
      User.create(name: 'JD', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from Peru', posts_counter: 0)
    end
    let!(:user2) do
      User.create(name: 'Austin', photo: 'https://th.bing.com/th/id/OIP.xlTxIX_i9UIgOJtZCd01jwHaHa?pid=ImgDet&rs=1',
                  bio: 'teacher from USA', posts_counter: 1)
    end

    before do
      visit users_path
    end

    it 'displays the username of all users' do
      expect(page).to have_selector('h2', text: 'JD')
      expect(page).to have_selector('h2', text: 'Austin')
    end

    it 'displays the profile picture for each user' do
      expect(page).to have_selector('img[alt="Profile photo"]', count: 2)
    end

    it 'displays the number of posts each user has written' do
      expect(page).to have_selector('h4', text: 'Number of posts: 0')
      expect(page).to have_selector('h4', text: 'Number of posts: 1')
    end

    it 'redirects to the user show page' do
      visit users_path
      click_link user1.name
      expect(page).to have_current_path(user_path(user1))
    end
  end
end
