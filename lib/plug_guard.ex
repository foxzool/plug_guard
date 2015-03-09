defmodule PlugGuard do
  use Application

  @doc false
  def start(_type, _args) do
    PlugGuard.Supervisor.start_link()
  end
end
