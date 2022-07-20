feature 'book a space' do
  scenario 'user can book a space' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name, available) VALUES ('Amy''s space', true);")
    connection.exec("INSERT INTO spaces (name, available) VALUES ('Kev''s space', true);")
    
    visit '/portal'

    click_button("Book Amy's space")

    expect(page).to have_content("You have booked Amy's space!")
  end
end
