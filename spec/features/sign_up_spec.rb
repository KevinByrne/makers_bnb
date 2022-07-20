feature 'sign up to service' do
  scenario 'user can sign up from index page' do
    visit('/')
    fill_in('first_name', with: 'Kev')
    click_button('Sign-Up')

    expect(page).to have_content 'Welcome Kev'
  end
end
