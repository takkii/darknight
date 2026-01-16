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
    |> render( "#{ status }.html" )

  end
end