defmodule PlugGuard.Server do
  def authorize_response(conn) do
    %{"grant_type"=> grant_type} = conn.params
    try do
      case grant_type do
        "authorization_code" ->  "authorization_code"
        "password" ->
          PlugGuard.Server.Token.Password.authorize(conn)
          "client_credentials" -> "client_credentials"
          "refresh_token" -> "refresh_token"
          :error ->  raise InvalidGrant
      end
      "ok"
    rescue
      e in InvalidClient -> e
    end
  end
end
