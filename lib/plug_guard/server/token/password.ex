defmodule PlugGuard.Server.Token.Password do
  def authorize(client) do
    %{"username" => username, "password" => password} = client.params
  end
end
