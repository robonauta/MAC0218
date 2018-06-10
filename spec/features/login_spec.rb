require 'rails_helper'

require 'spec_helper'

RSpec.feature 'Visitor signs in' do
  scenario 'with valid email and password' do
    @user1 = create(:user, username: 'test', email: 'test@test.com', password: 'xuxuxu')
    sign_in_with 'test@test.com', 'xuxuxu'
    #save_and_open_page
    expect(page).to have_content('Novo projeto')
  end

  scenario 'with invalid email' do
    sign_in_with 'invalid_email', 'password'
    expect(page).to have_content('Entrar')
  end

  scenario 'with blank password' do
    sign_in_with 'valid@example.com', ''
    expect(page).to have_content('Entrar')
  end

  def sign_in_with(email, password)
    visit '/sessions/new'
    @user = build(:user)
    fill_in 'email', with: email, visible: false
    fill_in 'password', with: password, visible: false
    click_button 'Entrar'
  end
  DatabaseCleaner.clean
end