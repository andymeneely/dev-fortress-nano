require 'squib'
require_relative 'version'

Squib::Deck.new(cards: 16) do
  use_layout file: 'layouts/actions.yml'
  background color: :white
  rect layout: :cut
  rect layout: :safe
  line x1: 75, x2: 750, y1: 1125/2, y2: 1125/2

  text str: 'Title Top',       layout: :top_title
  text str: 'Description top', layout: :top_desc
  text str: 'Next month top',  layout: :top_next_month

  text str: 'Title Bottom',       layout: :bottom_title
  text str: 'Description bottom', layout: :bottom_desc
  text str: 'Next month bottom',  layout: :bottom_next_month

  text layout: :version, str: DevFortressNano::VERSION

  save format: :png, prefix: 'action_'
end
