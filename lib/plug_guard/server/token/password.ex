defmodule PlugGuard.Server.Token.Password do
  def authorize(conn) do
    try do
      %{"username" => username, "password" => password} = conn.params
    rescue
      e -> raise InvalidClient
    end
  end
end
