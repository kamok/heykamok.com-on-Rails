RSpec::Matchers.define :have_max_word_of do |expected|
  match do |actual|
    actual.split(" ").length <= expected
  end
end

RSpec::Matchers.define :have_min_word_of do |expected|
  match do |actual|
    actual.split(" ").length >= expected
  end
end

RSpec::Matchers.define :be_this_or_that do |expected|
  match do |actual|
    actual == expected.first or expected.last
  end
end