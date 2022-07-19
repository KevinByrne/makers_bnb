feature 'view listings' do
  scenario 'display listings to user' do
    visit '/portal'

    expect(page).to have_content("Amy's space")
    expect(page).to have_content("Kev's space")
    expect(page).to have_content("Ollie's space")
  end
end
