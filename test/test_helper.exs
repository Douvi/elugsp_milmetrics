ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ElugspMilmetrics.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ElugspMilmetrics.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ElugspMilmetrics.Repo)

