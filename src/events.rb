require 'squib'

Squib::Deck.new(cards: 16) do
  use_layout file: 'layouts/events.yml'
  text str: 'Hello, World!'
  save format: :png, prefix: 'event_'
end
