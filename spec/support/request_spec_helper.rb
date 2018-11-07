module RequestSpecHelper
  # make JSON response easier to work with in the test suites
  def json
    JSON.parse(response.body)
  end
end
