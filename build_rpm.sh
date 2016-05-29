bundle install --deployment --without development test
bundle clean

fpm --after-install rpm_files/conf_initd.sh --after-remove rpm_files/rm_initd.sh \
  -f -s dir -t rpm -n monitor_client -v 1.0.0 -a noarch \
  --prefix /opt/monitor_client monitor config rpm_files  Gemfile Gemfile.lock lib/ monitor_client.rb vendor .bundle
