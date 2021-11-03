
feature 'Testing infrastructure' do
  scenario 'Can run app and check page content' do
    visit('/')
    expect(page).to have_content 'Testing infrastructure working!'
  end
end

feature 'Testing player input' do
  scenario 'Can receive player names in a form, submit the form, and see names on-screen' do
    visit('/')
    fill_in("player1name", with: "Red")
    fill_in("player2name", with: "Blue")
    click_button("Submit")
    expect(page).to have_content 'Red'
    expect(page).to have_content 'Blue'
  end
end