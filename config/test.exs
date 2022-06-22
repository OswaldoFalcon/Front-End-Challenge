import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :front_end_challenge, FrontEndChallengeWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "f5+Hm2eWz76YRowpOXBYcbW3gKD8I3aL8eoeBCI8PyD16iRnA5Z+HA6hVk7SrZ2j",
  server: false

# In test we don't send emails.
config :front_end_challenge, FrontEndChallenge.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
