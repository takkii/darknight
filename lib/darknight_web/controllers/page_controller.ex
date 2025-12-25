defmodule DarknightWeb.PageController do
  use DarknightWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
