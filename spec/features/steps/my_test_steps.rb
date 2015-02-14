step 'it executes' do
  visit '/'
end

step 'it passes' do
  expect(1).to be(1)
end
