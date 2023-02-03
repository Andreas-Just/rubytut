# frozen_string_literal: true

# option 1
require 'securerandom'

token = SecureRandom.alphanumeric(8)

puts token

# option 2
# symbols = ("A".."Z").to_a + ("a".."z").to_a + ("0".."9").to_a
symbols = [*"A".."Z", *"a".."z", *"0".."9"] # splat operator

token = ""

8.times { token += symbols.sample }

puts token
