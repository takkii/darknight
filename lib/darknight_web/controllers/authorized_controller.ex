defmodule DarknightWeb.Plug.EnsureAuthorized do
  @moduledoc """
  Plug that authorizes access for each endpoint
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

  @spec all_endpoints() :: list(%{controller: String.t(), action: String.t()})
  def all_endpoints() do
    endpoints_from_router =
      DarknightWeb.Router.__routes__()
      |> Enum.map(fn route ->
        %{controller: "#{route.plug}", action: route.plug_opts |> Atom.to_string()}
      end)

    endpoints_from_router
    |> Enum.uniq_by(&(&1[:controller] <> "." <> &1[:action]))
  end

  defp authorized?(conn, controller, action) do
    controller = conn |> Phoenix.Controller.controller_module() |> to_string()
    action = conn |> Phoenix.Controller.action_name() |> Atom.to_string()
  end
end