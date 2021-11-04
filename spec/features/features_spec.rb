
describe Battle do
  feature 'Testing infrastructure' do
    scenario 'Can run app and check page content' do
      visit('/')
      expect(page).to have_content 'Testing infrastructure working!'
    end
  end

  feature 'Testing setup' do
    before(:each) do
      sign_in_and_play
    end

    scenario 'Can receive player names in a form, submit the form, and see names on-screen' do
      expect(page).to have_content 'Red'
      expect(page).to have_content 'Blue'
    end

    scenario 'Displays the HP of player 2' do
      expect(page).to have_content "Player 2: Blue, HP: #{Battle::DEFAULT_HP}"
    end
  end

  feature 'Attacking works' do
    scenario 'When player 1 attacks, player 2 loses 20 HP' do
      sign_in_and_play
      click_button("Attack")
      expect(page).to have_content "Confirmed hit!"
    end
  end
end