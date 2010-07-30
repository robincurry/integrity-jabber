Gem::Specification.new do |s|
  s.name              = 'integrity-jabber'
  s.version           = '1.0.7'
  s.date              = '2010-07-30'
  s.summary           = 'Jabber notifier for the Integrity continuous integration server'
  s.description       = 'Easily let Integrity send jabber messages after each build'
  s.homepage          = 'http://integrityapp.com'
  s.email             = 'ph@heykimo.com'
  s.authors           = ['Pier-Hugues Pellerin']
  s.has_rdoc          = false
  s.files             = %w(
                          lib/notifier/config.haml
                          lib/notifier/jabber.rb
                        )

  s.add_dependency 'integrity'
  s.add_dependency 'jfcouture-xmpp4r-simple'
end
