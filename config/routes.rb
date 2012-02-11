Censormenot::Application.routes.draw do
  root :to => "lookups#lookup_form"

  post "search", :to => "lookups#search"

  get "dump", :to => "lookups#dump"
end
