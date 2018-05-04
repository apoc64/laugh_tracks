RSpec.describe 'Visitor goes to comedian page' do
  it 'shows name and age for comedians' do
    iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    tom = Comedian.create(name: "Tom Segura", age: 38)
    visit '/comedians'
    # As a visitor,
    # When I visit `/comedians`
    # Then I see a list of comedians with the following
    # information for each comedian:
    # * Name
    # * Age
    expect(page).to have_content('Iliza Shlesinger')
    expect(page).to have_content('34')
    expect(page).to have_content('Tom Segura')
    expect(page).to have_content('38')
  end
end
