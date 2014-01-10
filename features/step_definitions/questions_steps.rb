Given(/^I created the following questions:$/) do |table|
  table.hashes.each &method(:create_question)
end

When(/^I list the most recent questions$/) do
  list_recent_questions
end

Then(/^I should see the following questions:$/) do |table|
  # table is a Cucumber::Ast::Table
  pending # express the regexp above with the code you wish you had
end