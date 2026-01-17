defmodule DarknightWeb.FallbackController do
  use DarknightWeb, :controller
  alias DarknightWeb.ErrorView

  def call( conn, assigns ) do
    IO.puts "=================================="
    IO.inspect assigns
    IO.puts "=================================="

    status = 400
    conn
    |> put_status( status )
    |> put_view( ErrorView )
    |> render( "error_html.ex" )
  end

  def controller() do
    quote do
      use Phoenix.Controller, namespace: DarknightWeb
      import Plug.Conn
      alias DarknightWeb.Router.Helpers, as: Routes

      plug DarknightWeb.Plug.EnsureAuthorized

      action_fallback DarknightWeb.FallbackController
    end
  end
end