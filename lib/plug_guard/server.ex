defmodule PlugGuard.Server do
  import Plug.Conn

  def call(conn) do
    conn = fetch_params(conn)
    client = %PlugGuard.Client{params: format_params(conn),
      headers: format_headers(conn)}

    oauth_strategy(client)

      end

  def oauth_strategy(client) do
    %{"grant_type"=> grant_type} = client.params
    case grant_type do
      "authorization_code" ->  "authorization_code"
      "password" ->
        PlugGuard.Server.Token.Password.authorize(client)
        "client_credentials" -> "client_credentials"
        "refresh_token" -> "refresh_token"
        :error ->  "InvalidGrant"
    end
    {:ok, grant_type}
  end

  defp format_params(conn) do
    params_list = Enum.map(conn.params, fn({k, v}) -> {downcase(k), downcase(v)} end)
    Enum.into(params_list, %{})
  end

  defp downcase(p) do
    case p do
      p when is_binary(p) -> String.downcase(p)
      p -> p
    end
  end

  defp format_headers(conn) do
    Enum.into(conn.req_headers, %{})
  end
end
