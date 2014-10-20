module TestHelper
	def log_in_as_shm
    visit "Account/Login"
    fill_in 'Gebruikersnaam', with: "stefan.alaerts@vmsw.be"
    fill_in 'Wachtwoord', with: "aaaaaa"

    click_on 'Log in'
  end
end