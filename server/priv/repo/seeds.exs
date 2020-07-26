# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Server.Repo.insert!(%Server.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
Server.Repo.delete_all(Server.Activities.Task)

parent_mind_task = Server.Repo.insert!(%Server.Activities.Task{title: "Read 5 pages", description: "Reading is good", type: "mind"})
Server.Repo.insert!(%Server.Activities.Task{title: "Read 1 pages", description: "Reading is ok", type: "mind", parent_task: parent_mind_task.id})

parent_health_task = Server.Repo.insert!(%Server.Activities.Task{title: "DO A HEALTH THING", description: "Reading is good", type: "health"})
Server.Repo.insert!(%Server.Activities.Task{title: "DO A EASIER HEALTH THING", description: "Reading is ok", type: "health", parent_task: parent_health_task.id})

parent_career_task = Server.Repo.insert!(%Server.Activities.Task{title: "DO A CAREER THING", description: "Reading is good", type: "career"})
Server.Repo.insert!(%Server.Activities.Task{title: "DO A EASIER CAREER THING", description: "Reading is ok", type: "career", parent_task: parent_career_task.id})
