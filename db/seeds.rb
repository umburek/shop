admin = User.create(
  email: 'admin@admin.com',
  password: 'secret',
  password_confirmation: 'secret',
  role: :admin
)