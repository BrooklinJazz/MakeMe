defmodule ServerWeb.ActivitiesController do
    use ServerWeb, :controller

    def ping(conn, _params) do
        json(conn, %{response: "PING"})
    end
end