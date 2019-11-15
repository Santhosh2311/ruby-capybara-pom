class Homepage < Screen

def navigateTabs(tabName)
  click_link tabName
end

def clickLinks(link)
  click_on link
end

def cyclosLogin(userName,password)
  fill_in 'principal', with: userName
  fill_in 'password', with: password
  click_button('Sign in')
end

end
