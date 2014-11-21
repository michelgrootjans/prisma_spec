module TestHelper
  def log_in_as_shm
    log_in_as "stefan.alaerts@vmsw.be", "aaaaaa"
  end

  def log_in_as_gemeente
    log_in_as "michel.grootjans@gmail.com", "p7NtvG05"
  end

  def log_in_as username, password
    return if is_logged_in_with? username
    visit "Account/Logoff"
    visit "Account/Login"
    fill_in 'Gebruikersnaam', with: username
    fill_in 'Wachtwoord', with: password

    click_on 'Log in'
  end

  def is_logged_in_with? user_account
    page.has_text? user_account
  end
end