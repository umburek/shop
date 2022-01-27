admin = User.create(
  email: 'admin@admin.com',
  password: 'secret',
  password_confirmation: 'secret',
  role: :admin
)

[
  ['makaron świderki', 'pasta'],
  ['filet z kurczaka', 'meat'],
  ['cebula', 'vegetables'],
  ['papryka', 'vegetables'],
  ['pomidor', 'vegetables'],
  ['przecier pomidorowy', 'other'],
  ['ząbek czosnku', 'vegetables'],
  ['mozarella light', 'dairy'],
  ['olej', 'other'],
  ['woda', 'other'],
  ['mąka', 'other'],
  ['jajka', 'dairy'],
  ['śmietana', 'dairy'],
  ['wołowina', 'meat'],
  ['makaron spaghetti', 'pasta'],
  ['krewetki królewskie', 'seafood'],
  ['pomarańcza', 'fruit'],
  ['czekolada Milka', 'chocolate'],
  ['kakao Nesquik', 'chocolate'],
  ['rodzynki', 'delicacies'],
  ['mak', 'delicacies'],
  ['borowik', 'mushrooms'],
  ['kurka', 'mushrooms'],
  ['jajko na twardo', 'eggs'],
  ['kasza jaglana', 'groats'],
  ['kasza kuskus', 'groats'],
  ['szczypiorek', 'plants'],
  ['mięta', 'plants'],
  ['ryż jaśminowy', 'rice'],
  ['ryż brązowy', 'rice']
].each do |name, _category|
  Product.create(name: name)
end