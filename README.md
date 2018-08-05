# Simple Iugu

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/simple_iugu`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'simple_iugu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install simple_iugu

Add this to IuguSimple.rb Initializer:
```ruby
IuguSimple.api_key = YOUR_LIVE_API_TOKEN
IuguSimple.api_key_test = YOUR_TEST_API_TOKEN
IuguSimple.iugu_account_id = YOUR_ACCOUNT_ID
IuguSimple.is_test = TRUE_OR_FALSE
```

## Customers
### Create    
```ruby  
IuguSimple::Customer.create({
    email: 'email@example.com',
    name: 'example'
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#testinput-2
### Update
```ruby  
IuguSimple::Customer.update(CUSTOMER_ID, {
    email: 'email@example.com',
    name: 'example'
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#alterarr
### Destroy
```ruby  
IuguSimple::Customer.delete(CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
### Index
```ruby  
IuguSimple::Customer.index(ACCOUNT_ACCESS_TOKEN)
```
### Show
```ruby  
IuguSimple::Customer.show(CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/simple_iugu.
