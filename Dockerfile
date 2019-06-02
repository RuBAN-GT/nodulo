FROM elixir:1.8.1

COPY . /opt/nodulo
WORKDIR /opt/nodulo

RUN mix local.hex --force && mix local.rebar --force
RUN mix deps.get

CMD mix do clean, compile --force && mix ecto.create && mix ecto.migrate && mix memento_migrator.migrate && mix phx.server
