# frozen_string_literal: true

class Card < ApplicationRecord
  enum color: {
    purple: 0,
    green: 1,
    red: 2
  }
  enum shape: {
    oval: 0,
    squiggle: 1,
    diamon: 2
  }
  enum filling: {
    outline: 0,
    fill: 1,
    stripe: 2
  }
end
