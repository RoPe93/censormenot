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

staged_records = [
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.4", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.5", :trust => 0.34},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.6", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.7", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.8", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.9", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.10", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.11", :trust => 0.84},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.12", :trust => 0.43},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.13", :trust => 0.70},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.14", :trust => 1.00},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.15", :trust => 1.00},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.16", :trust => 0.00},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.17", :trust => 0.47},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.18", :trust => 0.99},
  {:domain => "thepiratebay.se", :ip => "194.71.107.15", :answered_by => "1.2.3.19", :trust => 0.22},
  {:domain => 'thepiratebay.se', :ip => '1.1.2.2', :answered_by => "1.4.7.3", :trust => 0.087},
  {:domain => 'thepiratebay.se', :ip => '1.1.2.2', :answered_by => "19.53.181.12", :trust => 0.987},
  {:domain => 'thepiratebay.se', :ip => '1.1.2.2', :answered_by => "18.19.193.91", :trust => 0.487},
]

namespace :seed do
  desc "Create seed for lookups"
  task :lookups => :environment do
    lookups.each do |lookup|
      Lookup.create(lookup)
    end
  end

  desc "Create seed for staged records"
  task :staged_records => :environment do
    staged_records.each do |rec|
      StagedRecord.create(rec)
    end
  end
end
