defmodule Nodulo.Bellas.PasswordHelper do
  @moduledoc """
  Argon2 usage follow Comeonin specification
  """

  alias Comeonin.PasswordHash
  import Argon2, only: [hash_pwd_salt: 1, verify_pass: 2]

  @doc """
  Encrypt input value
  """
  @spec encrypt_password(PasswordHash.password()) :: PasswordHash.password_hash()
  def encrypt_password(input) do
    hash_pwd_salt(input)
  end

  @doc """
  Compare input and already encrypted value
  """
  @spec is_correct_password?(PasswordHash.password(), PasswordHash.password_hash()) :: boolean
  def is_correct_password?(password, encrypted_password) do
    verify_pass(password, encrypted_password)
  end
end
