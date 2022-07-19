feature 'Viewing Index Page' do
  scenario 'visits Index page' do
    visit('/')
    expect(page).to have_content "Welcome to Makers BnB"
  end
end