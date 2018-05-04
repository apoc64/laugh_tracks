RSpec.describe 'Visitor goes to comedian page' do
  it 'shows name and age for comedians' do
    iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    tom = Comedian.create(name: "Tom Segura", age: 38)
    visit '/comedians'
    expect(page).to have_content('Iliza Shlesinger')
    expect(page).to have_content('34')
    expect(page).to have_content('Tom Segura')
    expect(page).to have_content('38')
  end

  it 'shows a list of comedian specials' do
    iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    Special.create(name: "War Paint", comedian_id: iliza.id)
    Special.create(name: "Freezing Hot", comedian_id: iliza.id)
    Special.create(name: "Confirmed Kills", comedian_id: iliza.id)
    visit '/comedians'
    expect(page).to have_content('War Paint')
    expect(page).to have_content('Freezing Hot')
    expect(page).to have_content('Confirmed Kills')
  end
end
