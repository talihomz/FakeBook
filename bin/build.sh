rails db:create
rails db:migrate

rm -rf ./tmp/pids/server.pid

rspec -f D