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

  it 'shows the average age for comedaians' do
    iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    tom = Comedian.create(name: "Tom Segura", age: 38)
    average_age = (iliza.age + tom.age) / 2
    visit '/comedians'
    expect(page).to have_content(average_age)
  end

  it 'shows list of comedains with a specific age' do
    iliza = Comedian.create(name: "Iliza Shlesinger", age: 34)
    hannibal = Comedian.create(name: "Hannibal Buress", age: 34)
    mike = Comedian.create(name: "Mike Birbiglia", age: 39)
    visit '/comedians?age=34'
    expect(page).to have_content(iliza.name)
    expect(page).to have_content(hannibal.name)
    expect(page).to_not have_content(mike.name)
  end
end
