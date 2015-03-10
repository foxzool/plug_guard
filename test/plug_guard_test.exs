defmodule PlugGuardTest do
  use ExUnit.Case, async: true
  use Plug.Test

  @default_path "/oauth"

  test "the truth" do
    params = %{"grant_type" => "password",
      "username" => "John", 
    }
  conn = conn(:post, @default_path <> "/token", params)

  conn = PlugGuard.call(conn, [])

  assert conn.status == 200
  end
end
