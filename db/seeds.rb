admin = User.create(
    :name => "Admin",
    :email => "shkumbhkar@bestpeers.com",
    :password => "123456",
    :password_confirmation => "123456"
    :type => "Admin"
)
admin.toggle!(:admin)