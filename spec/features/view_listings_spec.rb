feature 'view listings' do
  scenario 'display listings to user' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Ollie''s space', true, 'A not so lovely flat', 10.25);")
    
    visit '/portal'

    expect(page).to have_content("Amy's space - A lovely flat - £150.50 p/n")
    expect(page).to have_content("Kev's space - A lovely house - £200.00 p/n")
    expect(page).to have_content("Ollie's space - A not so lovely flat - £10.25 p/n")
  end

 
  scenario 'display updated listings to user after booking made' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Ollie''s space', true, 'A not so lovely flat', 10.25);")
    
    visit '/portal'
    click_button("Book Amy's space")

    expect(page).to have_no_button("Book Amy's space")
  end

end
