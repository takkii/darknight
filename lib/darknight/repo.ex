defmodule Darknight.Repo do
  use Ecto.Repo,
    otp_app: :darknight,
    adapter: Ecto.Adapters.Postgres
end
