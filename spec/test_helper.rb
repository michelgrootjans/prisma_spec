module TestHelper
  def log_in_as_shm
    return if is_logged_in_with? "stefan.alaerts@vmsw.be"
    visit "Account/Login"
    fill_in 'Gebruikersnaam', with: "stefan.alaerts@vmsw.be"
    fill_in 'Wachtwoord', with: "aaaaaa"

    click_on 'Log in'
  end

  def log_in_as_gemeente
    return if is_logged_in_with? "michel.grootjans@gmail.com"
    visit "Account/Login"
    fill_in 'Gebruikersnaam', with: "michel.grootjans@gmail.com"
    fill_in 'Wachtwoord', with: "p7NtvG05"

    click_on 'Log in'
  end

  def is_logged_in_with? user_account
    page.has_text? user_account
  end
end