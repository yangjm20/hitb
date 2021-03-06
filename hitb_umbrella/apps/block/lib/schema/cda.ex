defmodule Block.Cda do
  use Ecto.Schema
  import Ecto.Changeset
  alias Block.Cda


  schema "cda" do
    field :content, :string
    field :name, :string
    field :username, :string
    field :is_change, :boolean, default: false
    field :is_show, :boolean, default: false
    timestamps()
  end

  @doc false
  def changeset(%Cda{} = cda, attrs) do
    cda
    |> cast(attrs, [:username, :name, :content, :is_change, :is_show])
    |> validate_required([:username, :name, :content, :is_change, :is_show])
  end
end
