
describe Battle do
  feature 'Testing infrastructure' do
    scenario 'Can run app and check page content' do
      visit('/')
      expect(page).to have_content 'Testing infrastructure working!'
    end
  end

  feature 'Testing setup' do
    before(:each) do
      visit('/')
      fill_in("player_1_name", with: "Red")
      fill_in("player_2_name", with: "Blue")
      click_button("Submit")
    end

    scenario 'Can receive player names in a form, submit the form, and see names on-screen' do
      expect(page).to have_content 'Red'
      expect(page).to have_content 'Blue'
    end

    scenario 'Displays the HP of player 2' do
      expect(page).to have_content "Player 2: Blue, HP: #{100}"
    end
  end
end