defmodule Blog.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :body, :text, null: false
      add :title, :string, null: false
      add :published_at, :naive_datetime

      add :author_id, references(:users, type: :binary_id, on_delete: :nothing), null: false

      timestamps()
    end

    create index(:posts, [:author_id])
  end
end
