defmodule ServerWeb.TaskController do
  use ServerWeb, :controller

  alias Server.Activities
  alias Server.Activities.Task

  action_fallback ServerWeb.FallbackController

  def index(conn, _params) do
    tasks = Activities.list_tasks()
    render(conn, "index.json", tasks: tasks)
  end

  def create(conn, %{"task" => task_params}) do
    with {:ok, %Task{} = task} <- Activities.create_task(task_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.task_path(conn, :show, task))
      |> render("show.json", task: task)
    end
  end

  def show(conn, %{"id" => id}) do
    task = Activities.get_task!(id)
    render(conn, "show.json", task: task)
  end

  def update(conn, %{"id" => id, "task" => task_params}) do
    task = Activities.get_task!(id)

    with {:ok, %Task{} = task} <- Activities.update_task(task, task_params) do
      render(conn, "show.json", task: task)
    end
  end

  def delete(conn, %{"id" => id}) do
    task = Activities.get_task!(id)

    with {:ok, %Task{}} <- Activities.delete_task(task) do
      send_resp(conn, :no_content, "")
    end
  end


  def find_random_task(conn, _params) do
      task = Activities.find_random_task()
      # NOTE - how can i do this in a more concise syntax?
      json(conn, %{title: task.title, description: task.description, type: task.type, parent_task: task.parent_task, id: task.id})
  end

  def find_task_by_type(conn, %{"type" => type}) do
      task = Activities.find_task_by_type(type)
      json(conn, %{title: task.title, description: task.description, type: task.type, parent_task: task.parent_task, id: task.id})
  end

  def find_easier_task(conn, %{"parent_task" => parent_task}) do
      task = Activities.find_easier_task(parent_task)
      json(conn, %{title: task.title, description: task.description, type: task.type, parent_task: task.parent_task})
  end
end
