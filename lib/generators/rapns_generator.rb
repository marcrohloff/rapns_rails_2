class RapnsGenerator < Rails::Generator::Base

  def manifest
    record do |m|

      puts m.class

      m.file 'rapns.rb', 'config/initializers/rapns.rb'

      create_migration m, "create_rapns_notifications"
      create_migration m, "create_rapns_feedback"
      create_migration m, "add_alert_is_json_to_rapns_notifications"
      create_migration m, "add_app_to_rapns"
      create_migration m, "create_rapns_apps"
      create_migration m, "add_gcm"

    end

  end

  def create_migration(m, filename)
    m.migration_template "#{filename}.rb", "db/migrate", :migration_file_name => filename
  end

end
