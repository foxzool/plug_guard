defmodule PlugGuard do
  @default_path "/oauth"

  import Plug.Conn
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  post @default_path <> "/token" do
    conn
    |> PlugGuard.Server.call
    |> send_resp(200, "hello")
  end
end
