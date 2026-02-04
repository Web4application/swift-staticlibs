post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['LD'] = '$(PROJECT_DIR)/path/to/ld.py'
    end
  end
end
