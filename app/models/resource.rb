class Resource < ActiveResource::Base

  self.site = 'http://localhost:9292'
  self.user = 'defaultuser'
  self.password = 'defaultpass'
  self.include_format_in_path = false

end