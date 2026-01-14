defmodule DarknightWeb.HomeController do
  use DarknightWeb, :controller

  def dark(conn, _params) do
    render(conn, :dark)
  end
end