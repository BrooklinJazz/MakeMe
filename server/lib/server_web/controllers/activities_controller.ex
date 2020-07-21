defmodule ServerWeb.ActivitiesController do
    use ServerWeb, :controller

    def ping(conn, _params) do
        json(conn, %{response: "PING"})
    end

    def find_random(conn, _params) do
        json(conn, %{title: "Read 5 Pages of a book"})
    end

    def find_another(conn, _params) do
        json(conn, %{title: "Read 1 Page of a book"})
    end
end