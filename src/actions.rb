require 'squib'

Squib::Deck.new(cards: 16) do
  use_layout file: 'layouts/actions.yml'
  text str: 'Hello, World!'
  save format: :png, prefix: 'action_'
end
