# Default Recipe

include_recipe "nodejs"

#if ($RAILS_APP != '') 
application 'web_app' do
    path  '$folder/$RAILS_APP'
    owner 'root'
    group 'root'
    repository '$CLONE_URL'
  
    rails do
      bundler true
      precompile_assets true
      database do
        adapter "sqlite3"
        database "db/$RAILS_APP.sqlite3"
      end
    end
end
#end