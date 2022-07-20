feature 'view listings' do
  scenario 'display listings to user' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available) VALUES ('Amy''s space', true);")
    connection.exec("INSERT INTO spaces (name, available) VALUES ('Kev''s space', true);")
    connection.exec("INSERT INTO spaces (name, available) VALUES ('Ollie''s space', true);")
    
    visit '/portal'

    expect(page).to have_content("Amy's space")
    expect(page).to have_content("Kev's space")
    expect(page).to have_content("Ollie's space")
  end
end
