alias Nodulo.Bellas.{Factory,Repo,User,UserSetting}

# Clear all users
UserSetting |> Repo.delete_all()
User |> Repo.delete_all()

# Create users
user = %User{
  email: "dkruban@gmail.com",
  name: "Dima"
}

%User{id: user_id} = Repo.insert!(user)

# Create settings
Factory.build(:user_setting, %{user_id: user_id})
|> Repo.insert!()

# Tests
# db_user =
#   Nodulo.Bellas.User
#   |> Nodulo.Bellas.Repo.one()
#   |> Nodulo.Bellas.Repo.preload(:settings)
