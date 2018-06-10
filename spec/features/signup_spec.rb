require 'rails_helper'

require 'spec_helper'

RSpec.feature 'Visitor signs up' do
  scenario 'with valid info' do
    sign_up_with 'Fulano', 'valid@example.com', 'xuxuxu', 'xuxuxu', 'Fulano de Tal', 'VASP'

    expect(page).to have_content('Novo projeto')
  end

  scenario 'with invalid email' do
    sign_up_with 'Fulano', 'invalid_email', 'password', 'password', 'Fulano de Tal', 'VASP'

    expect(page).to have_content('Registrar')
  end

  scenario 'with blank password' do
    sign_up_with 'Fulano', 'valid@example.com', '', '', 'Fulano de Tal', 'VASP'
    expect(page).to have_content('Registrar')
  end

  scenario 'with blank name' do
    sign_up_with '', 'valid@example.com', 'xuxuxu', 'xuxuxu', 'Fulano de Tal', 'VASP'
    expect(page).to have_content('Registrar')
  end

  scenario 'with different passwords' do
    sign_up_with 'Fulano', 'valid@example.com', 'xuxuxu', 'xaxaxa', 'Fulano de Tal', 'VASP'
    expect(page).to have_content('Registrar')
  end

  scenario 'with blank organization' do
    sign_up_with 'Fulano', 'valid@example.com', 'xuxuxu', 'xuxuxu', 'Fulano de Tal', ''
    expect(page).to have_content('Novo projeto')
  end

  def sign_up_with(username, email, password, confpassword, name, organization)
    visit signup_path
    fill_in 'username', with: username
    fill_in 'email', with: email
    fill_in 'password', with: password
    fill_in 'confpassword', with: confpassword
    fill_in 'name', with: name
    fill_in 'org', with: organization
    click_button 'Registrar'
  end
end