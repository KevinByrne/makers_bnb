feature 'view listings' do
  scenario 'display listings to user' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name) VALUES ('Amy''s space');")
    connection.exec("INSERT INTO spaces (name) VALUES ('Kev''s space');")
    connection.exec("INSERT INTO spaces (name) VALUES ('Ollie''s space');")
    
    visit '/portal'

    expect(page).to have_content("Amy's space")
    expect(page).to have_content("Kev's space")
    expect(page).to have_content("Ollie's space")
  end
end
