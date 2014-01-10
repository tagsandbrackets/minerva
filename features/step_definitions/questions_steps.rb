Given(/^I created the following questions:$/) do |table|
  table.hashes.each &method(:create_question)
end

When(/^I list the most recent questions$/) do
  list_recent_questions
end

Then(/^I should see the following questions:$/) do |table|
  expected_order = table.hashes.map { |h| h['title'] }
  expected_order.each do |title|
    expect(page).to have_selector '.question .title', text: title 
  end
end