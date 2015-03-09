defmodule PlugGuard.Supervisor do
  @doc false
  def start_link() do
    Supervisor.start_link(__MODULE__, :ok, name: __MODULE__)
  end

  @doc false
  def init(:ok) do
    import Supervisor.Spec

    children = [
    ]

  supervise(children, strategy: :one_for_one)
  end
end
