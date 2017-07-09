def sign_in
  visit '/users/new'
  fill_in 'user[name]', with: "Winnie-the-Pooh"
  fill_in 'user[group]', with: "100"
  fill_in 'user[password]', with: "100acres"
  fill_in 'user[confirm_password]', with: "100acres"
  click_button "Submit"
end

def add_bag
  visit '/bags/new'
  fill_in 'bag[name]', with: "Piglet"
  fill_in 'bag[number]', with: 1
  fill_in 'bag[description]', with: "purple"
  click_button "Submit"
end
