# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_WebLog_session',
  :secret      => '4b36d4c262041cbea12e0aa13b34d5e59342e7610eb6d43d772c02f97383d980d98f0b8206988f2263809196977d384fd20b6fb9fe44400c4a2e377cc82e749d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
