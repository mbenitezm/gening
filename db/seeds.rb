Role.create([{ name: 'admin' }, { name: 'regular_user' }])
admin = User.create(email: 'admin@admin.com', name: 'admin',
                    last_name: 'admin', username: 'admin', password: 'aguacate',
                    password_confirmation: 'aguacate', role_id: 1)