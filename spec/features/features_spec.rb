
describe Battle do
  feature 'Testing infrastructure' do
    scenario 'Can run app and check page content' do
      visit('/')
      expect(page).to have_content 'Enter your names below.'
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
    before(:each) do
      sign_in_and_play
      click_button("Attack")
    end

    scenario 'When player 1 attacks, confirms player 2 has been hit' do
      expect(page).to have_content "Confirmed hit!"
    end

    scenario 'When player 1 attacks, player 2 loses 10 points HP' do
      expect(page).to have_content "Blue HP: 90"
    end

    scenario 'After an attack, clicking Continue returns to the main page' do
      click_button("Continue")
      expect(page).to have_content "Player 1: "
    end
  end

  feature 'Switching turns' do
    scenario "Shows that it's player 1's turn on ititiation"  do
      sign_in_and_play
      expect(page).to have_content "It's Red's turn."
    end

    scenario "Shows that it's player 2's turn after the first turn" do
      sign_in_and_play
      click_button("Attack")
      click_button("Continue")
      expect(page).to have_content "It's Blue's turn."
    end

    scenario "After showing that it's player 2's turn, player 2 should damage player 1" do
      sign_in_and_play
      click_button("Attack")
      click_button("Continue")
      click_button("Attack")
      expect(page).to have_content "Confirmed hit! Blue attacked Red."
    end 
  end
end