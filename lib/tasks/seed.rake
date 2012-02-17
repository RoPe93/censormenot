lookups = [
  {:domain => 'stackoverflow.com', :ip => '64.34.119.12', :trust => 1},
  {:domain => 'demonoid.me', :ip => '62.149.24.67', :trust => 1},
  {:domain => 'thepiratebay.se', :ip => '194.71.107.15', :trust => 1},
  {:domain => 'thepiratebay.se', :ip => '194.71.100.10', :trust => 0.613},
  {:domain => 'thepiratebay.se', :ip => '2.2.2.2', :trust => 0.355},
  {:domain => 'thepiratebay.se', :ip => '1.1.2.2', :trust => 0.087},
  {:domain => 'torrentz.eu', :ip => '68.71.55.21', :trust => 1},
  {:domain => 'kat.ph', :ip => '205.204.88.154', :trust => 1}
]

namespace :seed do
  desc "Create seed for lookups"
  task :lookups => :environment do
    lookups.each do |lookup|
      Lookup.create(lookup)
    end
  end
end
