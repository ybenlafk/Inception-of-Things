sudo gitlab-rails runner "token = User.find_by_username('root').personal_access_tokens.create(scopes: ['api'], name: 'bonus_token', expires_at: 365.days.from_now); token.set_token('bonus_pass'); token.save!"

