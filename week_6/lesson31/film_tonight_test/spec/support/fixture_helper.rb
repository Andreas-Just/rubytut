# frozen_string_literal: true

# This module provides helper methods for handling fixture files in tests.
module FixtureHelper
  def fixture_path(path)
    File.join(File.dirname(__FILE__), '../fixtures', path)
  end
end
