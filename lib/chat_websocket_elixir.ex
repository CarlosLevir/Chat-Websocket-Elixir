defmodule ChatWebsocketElixir do
  use Application

  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: ChatWebsocketElixir.Router,
        options: [
          dispatch: dispatch(),
          port: 4000
        ]
      ),
      Registry.child_spec(
        keys: :duplicate,
        name: Registry.ChatWebsocketElixir
      )
    ]

    opts = [strategy: :one_for_one, name: ChatWebsocketElixir.Application]
    Supervisor.start_link(children, opts)
  end

  defp dispatch do
    [
      {:_,
       [
         {"/ws/[...]", ChatWebsocketElixir.SocketHandler, []},
         {:_, Plug.Cowboy.Handler, {ChatWebsocketElixir.Router, []}}
       ]}
    ]
  end
end
