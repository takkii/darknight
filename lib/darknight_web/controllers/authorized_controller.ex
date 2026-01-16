defmodule DarknightWeb.Plug.EnsureAuthorized do
  @moduledoc """
  エンドポイント毎のアクセス認可を行うPlug
  """

  def init(default), do: default

  @spec call(Plug.Conn.t(), any()) :: Plug.Conn.t() | any()
  def call(conn, _params) do
    controller = conn |> Phoenix.Controller.controller_module() |> to_string()
    action = conn |> Phoenix.Controller.action_name() |> Atom.to_string()

    conn
    |> DarknightWeb.Guardian.Plug.current_resource()
    |> authorized?(controller, action)
    |> case do
         true -> conn
         _ -> conn |> DarknightWeb.FallbackController.call({:error, :forbidden})
       end
  end

  defp authorized?(user, controller, action) do
    # Check authorization
  end
end