Given(/^i'm on the exercise 1 screen$/) do
  @browser.goto 'https://www.exercise1.com/values'
end
When(/^i count the number of values$/) do
  @values = []
  (1..5).each do |v|
  @values << on(ExerciseOne).send("value#{v}_element").present?
  end
end
Then(/^i should see (\d+) values$/) do |value_count|
     expect(@values.count(true)).to eq(value_count)
end

When(/^i gather the amounts from values$/) do
  @amounts = []
  (1..5).each do |v|
    @amounts << on(ExerciseOne).send("value#{v}_element").value
  end
end

Then(/^i should see all the amounts to be greater than zero$/) do
  @amounts.each do |amt|
  expect(amt.gsub(/[$,]/,'').to_f).to be > 0
  end
end
And(/^i gather amount from total balance$/) do
   @total = on(ExerciseOne).value6_element.value
end
Then(/^the total balance must be equal to the summation of Values$/) do
  @sum_of_values = 0.0
  @amounts.each do |amt|
    @sum_of_values += amt.gsub(/[$,]/,'').to_f
  end
  expect(@sum_of_values).to eq(@total.gsub(/[$,]/,'').to_f)
end
Then(/^all the amounts should be preceded by dollar sign$/) do
  @amounts.each do |amt|
  expect(amt.gsub(/[,.]/,'')[0]).to eq('$')
  end
  expect(@total.gsub(/[,.]/,'')[0]).to eq('$')
end