feature 'Sign up to service' do
  scenario 'User visits index page to sign up' do
    visit('/')
    fill_in('first_name', with: 'Kev')
    click_button('Sign-Up')

    expect(page).to have_content 'Welcome Kev'
  end
end