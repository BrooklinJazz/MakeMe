defmodule Server.ActivitiesTest do
  use Server.DataCase

  alias Server.Activities
  alias Server.Activities.Task

  @valid_attrs %{description: "some description", title: "some title", type: "mind"}
  @update_attrs %{description: "some updated description", title: "some updated title", type: "some updated type"}
  @invalid_attrs %{description: nil, title: nil, type: nil}

  def task_fixture(attrs \\ %{}) do
    {:ok, task} =
      attrs
      |> Enum.into(@valid_attrs)
      |> Activities.create_task()
    task
  end

  describe "Activities" do
    test "find_random_task -> find_easier_task _ parent_task _ child_task" do
      parent_task = task_fixture()
      child_task = task_fixture(%{parent_task: parent_task.id})
      assert child_task.parent_task == parent_task.id
      # find_random_task should only find parent task
      (1 .. 100) |> Enum.each(fn _ -> assert Activities.find_random_task() == parent_task end)
      # too_hard should only find child task
      (1 .. 100) |> Enum.each(fn _ -> assert Activities.find_easier_task(parent_task.id) == child_task end)
    end

    test "find_task_by_type(mind) _ 1 mind task _ 1 body task" do
      mind_task = task_fixture(%{type: "mind"})
      health_task = task_fixture(%{type: "health"})
      (1 .. 100) |> Enum.each(fn _ -> assert Activities.find_task_by_type("mind") == mind_task end)
      (1 .. 100) |> Enum.each(fn _ -> assert Activities.find_task_by_type("health") == health_task end)
    end
  end

  # default tests provided by mix phx.gen.json
  describe "tasks" do
    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Activities.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Activities.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Activities.create_task(@valid_attrs)
      assert task.description == "some description"
      assert task.title == "some title"
      assert task.type == "mind"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Activities.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, %Task{} = task} = Activities.update_task(task, @update_attrs)
      assert task.description == "some updated description"
      assert task.title == "some updated title"
      assert task.type == "some updated type"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Activities.update_task(task, @invalid_attrs)
      assert task == Activities.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Activities.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Activities.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Activities.change_task(task)
    end
  end
end
