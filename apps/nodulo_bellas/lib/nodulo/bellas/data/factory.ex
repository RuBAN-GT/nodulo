defmodule Nodulo.Bellas.Factory do
  @moduledoc false

  use ExMachina.Ecto, repo: Nodulo.Bellas.Repo
  alias Nodulo.Bellas.{User, UserSetting}

  def user_setting_factory do
    %UserSetting{
      name: FakerElixir.App.name(),
      value: FakerElixir.Lorem.word()
    }
  end

  def user_factory do
    %User{
      email: FakerElixir.Internet.email(),
      name: FakerElixir.Internet.user_name(),
      password: "hello_world",
      settings: []
    }
  end
end
