defmodule Server.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :title, :string
      add :description, :text
      add :type, :string
      add :parent_task, references(:tasks, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:parent_task])
  end
end
