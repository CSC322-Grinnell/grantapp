Given(/^the following funding sources exist:$/) do |users|
  users.hashes.each do |user|
    User.create!(user)
  end
end

