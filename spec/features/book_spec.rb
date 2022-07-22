feature 'book a space' do
  scenario 'user can book a space' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
    
    visit '/spaces'

    click_button("Book Amy's space")

    expect(page).to have_content("You have booked Amy's space!")
  end

  scenario 'user can book multiple spaces' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
    
    visit '/spaces'

    click_button("Book Amy's space")

    click_button("Return to view all available Spaces")

    click_button("Book Kev's space")

    expect(page).to have_content("You have booked Kev's space!")
    expect(page).to have_content("Your bookings:\nAmy's space Kev's space")
  end

  scenario 'user can view existing bookings' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Amy''s space', true, 'A lovely flat', 150.50);")
    connection.exec("INSERT INTO spaces (name, available, space_description, price) VALUES ('Kev''s space', true, 'A lovely house', 200.00);")
    
    visit '/spaces'

    click_button("Book Amy's space")

    click_button("Return to view all available Spaces")

    click_button("View your bookings")

    expect(page).to have_content("Your bookings:\nAmy's space")
  end

end
