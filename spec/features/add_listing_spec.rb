feature 'add space to listings' do
  xscenario 'user can add their space to the listings' do
    visit('/portal')
    fill_in('space_name', with: "Murphy's couch")
    fill_in('space_description', with: "A lovely comfy couch")
    fill_in('price', with: "9.99")
    click_button('Add this space')

    expect(page).to have_content "Murphy's couch - A lovely comfy couch - £9.99"
  end
end