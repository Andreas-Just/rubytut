# frozen_string_literal: true

require 'simplecov'
SimpleCov.start

require_relative '../lib/film'
require_relative './support/fixture_helper'

RSpec.configure do |config|
  config.include FixtureHelper
end
