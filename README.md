# Stytch Ruby Gem

The Stytch Ruby gem makes it easy to use the Stytch user infrastructure API in Ruby applications.

It pairs well with the Stytch [Web SDK](https://www.npmjs.com/package/@stytch/stytch-js) or your own custom authentication flow.

## Install

Add this line to your application's Gemfile:

```ruby
gem 'stytch'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install stytch

## Usage

You can find your API credentials in the [Stytch Dashboard](https://stytch.com/dashboard/api-keys).

Create an API client:
```ruby
client = Stytch::Client.new(
    env: :test, # available environments are :test and :live
    project_id: "***",
    secret: "***"
)
```

Send a magic link by email:
```ruby
client.magic_links.email.login_or_create(
    email: "sandbox@stytch.com",
    login_magic_link_url: "https://example.com/login",
    signup_magic_link_url: "https://example.com/signup",
)
```

Authenticate the token from the magic link:
```ruby
client.magic_links.authenticate(
    token: "DOYoip3rvIMMW5lgItikFK-Ak1CfMsgjuiCyI7uuU94=",
)
```

## Handling Errors

When possible the response will contain an `error_type` and an `error_message` that can be used to distinguish errors.

Learn more about errors in the [docs](https://stytch.com/docs/api/errors).

## Documentation

See example requests and responses for all the endpoints in the [Stytch API Reference](https://stytch.com/docs/api).

Follow one of the [integration guides](https://stytch.com/docs/guides) or start with one of our [example apps](https://stytch.com/docs/example-apps).

## Support

If you've found a bug, [open an issue](https://github.com/stytchauth/stytch-ruby/issues/new)!

If you have questions or want help troubleshooting, join us in [Slack](https://join.slack.com/t/stytch/shared_invite/zt-nil4wo92-jApJ9Cl32cJbEd9esKkvyg) or email support@stytch.com.

If you've found a security vulnerability, please follow our [responsible disclosure instructions](https://stytch.com/docs/security).

## Development

See [DEVELOPMENT.md](DEVELOPMENT.md)

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Stytch project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](CODE_OF_CONDUCT.md).
