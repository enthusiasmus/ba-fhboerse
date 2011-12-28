Rails.application.config.middleware.use OmniAuth::Builder do
  provider :browser_id
  provider :facebook, '312881875418018', '86c014d21d04f0f032e9cd0fb7893026'
  provider :twitter, 'wcMqnJrCpJtOAsjw3k85Qg', 'NqWBpTHFGrt91x8n0or5WyWlCQ3nmd3uZOb7JBCX4'
end