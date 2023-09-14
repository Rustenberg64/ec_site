FROM ruby:3.2.2
RUN apt update -qq && apt install -y build-essential libpq-dev nodejs postgresql-client
RUN groupadd -r -g 1000 rails && useradd -r -u 1000 -g rails -m rails

COPY ./ /workspece
RUN chown -R rails:rails /workspece
WORKDIR /workspece

# USER rails
ENV RAILS_ENV=production RAILS_SERVE_STATIC_FILES=true
RUN bundle install
# RUN bundle exec rails db:migrate
# RUN bundle exec rails db:seed
RUN bundle exec rails db:setup && bundle exec rails assets:precompile
CMD ["bundle", "exec", "rails", "s", "-p", "80", "-b", "0.0.0.0"]