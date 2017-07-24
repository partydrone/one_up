OmniAuth.config.test_mode = true

OmniAuth.config.mock_auth[:discord] = OmniAuth::AuthHash.new({
  provider: 'discord',
  uid: '1234567891',
  info: {
    first_name: 'Saruman',
    last_name: 'the Wise',
    email: 'saruman@orthanc.com'
  }
})
