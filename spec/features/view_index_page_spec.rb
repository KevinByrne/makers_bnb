feature 'viewing index page' do
  scenario 'visit index page' do
    visit('/')
    expect(page).to have_content "Welcome to Makers BnB"
  end
end
