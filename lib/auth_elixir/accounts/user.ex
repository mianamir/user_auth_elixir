defmodule AuthElixir.Accounts.User do
  alias AuthElixir.Accounts.Encryption
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    ## physical fields, which will be in the database
    field :email, :string
    field :password_hash, :string
    field :username, :string
    ## virtual fields, which will not in database
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true


    timestamps()
  end

  @required_fields ~w(email username password)
  @optional_fields ~w()
  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, @required_fields, @optional_fields)
    |> validate_required([:username, :email])
    |> validate_format(:email, ~r/@/)
    |> validate_length(:password, min: 6)
    |> validate_confirmation(:password)
    |> unique_constraint(:email)
    |> encrypt_password
  end

  defp encrypt_password(changeset) do
    password = get_change(changeset, :password)

    if password do
      encrypted_password = Encryption.hash_password(password)
      put_change(changeset, :password_hash, encrypted_password)
    else
      changeset
    end
  end

end