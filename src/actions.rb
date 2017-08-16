require 'squib'
require_relative 'version'

raw_data = Squib.xlsx(file: 'data/game.xlsx', sheet: 0)

File.open('data/actions.txt', 'w+') { |f| f.write raw_data.to_pretty_text }

top_data    = Squib::DataFrame.new
bottom_data = Squib::DataFrame.new
0.upto(15).each do |i|
  raw_data.columns.each do |col|
    top_data[col] ||= []
    top_data[col][i] = raw_data[col][2 * i]
    bottom_data[col] ||= []
    bottom_data[col][i] = raw_data[col][2 * i + 1]
  end
end

Squib::Deck.new(cards: 16) do
  use_layout file: 'layouts/actions.yml'
  background color: :white
  rect layout: :cut
  rect layout: :safe
  line x1: 75, x2: 750, y1: 1125/2, y2: 1125/2

  text str: top_data.title,       layout: :top_title
  text str: top_data.cost,        layout: :top_cost
  text str: top_data.description, layout: :top_desc
  text str: top_data.rollover,    layout: :top_rollover

  text str: bottom_data.title,       layout: :bottom_title
  text str: bottom_data.cost,        layout: :bottom_cost
  text str: bottom_data.description, layout: :bottom_desc
  text str: bottom_data.rollover,    layout: :bottom_rollover

  text layout: :version, str: DevFortressNano::VERSION

  save format: :png, prefix: 'action_'
  save_pdf file: 'actions.pdf', trim: '0.125in'
end
