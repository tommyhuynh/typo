And /^I am logged in as a non-admin$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'admin'
  fill_in 'user_password', :with => 'aaaaaaaa'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end

Given /^the user blog is set up$/ do
  Blog.default.update_attributes!({:blog_name => 'Blog Blog',
                                   :base_url => 'http://localhost:3000'});
  Blog.default.save!
  User.create!({:login => 'user',
                :password => 'useruseruser',
                :email => 'user@user.com',
                :profile_id => 2,
                :name => 'user',
                :state => 'active'})
end

And /^I am logged into the user panel$/ do
  visit '/accounts/login'
  fill_in 'user_login', :with => 'user'
  fill_in 'user_password', :with => 'useruseruser'
  click_button 'Login'
  if page.respond_to? :should
    page.should have_content('Login successful')
  else
    assert page.has_content?('Login successful')
  end
end