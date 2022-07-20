feature 'book a space' do
  scenario 'user can book a space' do
    connection = PG.connect(dbname: 'makersbnb_test')
    connection.exec("INSERT INTO spaces (name) VALUES ('Amy''s space');")
    connection.exec("INSERT INTO spaces (name) VALUES ('Kev''s space');")
    
    visit '/portal'

    click_button("Book Amy's space")

    expect(page).to have_content("You've booked Amy's space!")
  end
end
