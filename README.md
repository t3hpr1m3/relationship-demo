HABTM
=====

Quick demo showing a `has_and_belongs_to_many` relationship in Rails.

Running
=======
If Ruby is installed, simply run:

```shell
# bundle install
# bundle exec rake db:migrate
# bundle exec rake db:seed
# bundle exec rails s
```

If Ruby is unavailable, but docker-compose is:
```
# docker-compose build
# docker-compose run app rake db:migrate
# docker-compose run app rake db:seed
# docker-compose up -d
```
