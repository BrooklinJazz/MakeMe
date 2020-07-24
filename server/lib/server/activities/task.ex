defmodule Server.Activities.Task do
  use Ecto.Schema
  import Ecto.Changeset

  schema "tasks" do
    field :description, :string
    field :title, :string
    field :type, :string
    field :parent_task, :id

    timestamps()
  end

  @doc false
  def changeset(task, attrs) do
    task
    |> cast(attrs, [:title, :description, :type, :parent_task])
    |> validate_required([:title, :description, :type])
  end
end
