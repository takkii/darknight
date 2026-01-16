defmodule DarknightWeb.HomeController do
  use DarknightWeb, :controller

  def dark(conn, _params) do
    render(conn, :dark)
  end

  def controller() do
    quote do
      use Phoenix.Controller, namespace: MyApp
      import Plug.Conn
      alias DarknightWeb.Router.Helpers, as: Routes

      plug DarknightWeb.Plug.EnsureAuthorized

      action_fallback DarknightWeb.FallbackController
    end
  end
end
