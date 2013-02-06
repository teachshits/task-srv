Client.create! [
    { name: 'Trusted client',     keyword: 'TRU' },
    { name: 'Yet another client', keyword: 'YAC' }
  ]

User.create! email: 'admin@example.com',
             password: 'password'