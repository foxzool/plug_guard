defmodule PlugGuard do
  @default_path "/oauth"

  import Plug.Conn
  use Plug.Router

  plug Plug.Logger
  plug :match
  plug :dispatch

  post @default_path <> "/token" do
    conn = fetch_params(conn)

    IO.inspect conn.params

    body = PlugGuard.Server.authorize_response(conn)
    IO.inspect body
    send_resp(conn, 200, "hello")
  end
end
