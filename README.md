# Simple Iugu

Gem to consume IuguApi

obs: the ACCOUNT_ACCESS_TOKEN constant **don't** need to be send if the action does not involve a **sub-account**

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


## Customer
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
    Documentation: https://dev.iugu.com/v1.0/reference#remover-1
### Index
```ruby  
IuguSimple::Customer.index(ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#listar-1
### Show
```ruby  
IuguSimple::Customer.show(CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#

## Payment Token
### Create
```ruby  
IuguSimple::PaymentToken.create({
    method: credit_card,
    test: TRUE_OR_FALSE,
    data: {
        number: CREDIT_CARD_NUMBER,
        verification_value: CREDIT_CARD_CVV,
        first_name: CREDIT_CARD_FIRST_NAME,
        last_name: CREDIT_CARD_LAST_NAME,
        month: CREDIT_CARD_MONTH_EXPIRATION,
        year: CREDIT_CARD_YEAR_EXPIRATION
    }
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#testinput

## Payment Method
### Create
```ruby  
IuguSimple::PaymentMethod.create(customer_id: CUSTOMER_ID,{
    description: 'My credit card',
    token: PAYMENT_TOKEN,
    set_as_default: TRUE_OR_FALSE
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#testinput-3
### Update
```ruby  
IuguSimple::PaymentMethod.update(customer_id: CUSTOMER_ID, id: ID, {
    description: 'My credit card',
    set_as_default: TRUE_OR_FALSE
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#alterar
### Destroy
```ruby  
IuguSimple::PaymentMethod.delete(customer_id: CUSTOMER_ID, id: ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#remover-2
### Show
```ruby  
IuguSimple::PaymentMethod.show(customer_id: CUSTOMER_ID, id: ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#testinput-4
### Index
```ruby  
IuguSimple::PaymentMethod.index(customer_id: CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#listar-2

## Invoice
### Create
```ruby  
IuguSimple::Invoice.create({
    email: 'email@example.com',
    due_date: "AAA-MM-DD",
    items: [
        {
            description: ITEM_DESCRIPTION,
            quantity: ITEM_QUANTITY,
            price_cents: UNITY_PRICE_CENTS
        }
    ]
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#criar-fatura
### Duplicate
```ruby  
IuguSimple::Invoice.duplicate(INVOICE_ID, {
    due_date: "AAA-MM-DD"
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#gerar-segunda-via
### Capture
```ruby  
IuguSimple::Invoice.capture(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#capturar-fatura
### Show
```ruby  
IuguSimple::Invoice.show(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#detalhes
### Index
```ruby  
IuguSimple::Invoice.index({
    limit: 50
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#listar-faturas
### Cancel
```ruby  
IuguSimple::Invoice.cancel(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#cancelar
### Refund
```ruby  
IuguSimple::Invoice.refund(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation: https://dev.iugu.com/v1.0/reference#reembolsar-fatura
## Charge
### Create
```ruby  
IuguSimple::Charge.create({
    customer_payment_method_id: CUSTOMER_PAYMENT_METHOD
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#cobranca-direta
## Sub Account
### Create
```ruby  
IuguSimple::SubAccount.create({
    name: PARTNER_NAME,
    comission: {
        percent: SOME_PERCENT
    }
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#criar-conta
### Verify
```ruby  
IuguSimple::SubAccount.verify(IUGU_ACCOUNT_ID, {
    data: {
    }
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#enviar-verificacao-de-conta
### Update
```ruby  
IuguSimple::SubAccount.update({
    name: OTHER_NAME
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#configurar-conta
### Show
```ruby  
IuguSimple::SubAccount.show(IUGU_ACCOUNT_ID, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#informacoes-da-conta
### Index
```ruby  
IuguSimple::SubAccount.index({
    limit: 50
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#listar-as-contas
## Bank
### Create
```ruby  
IuguSimple::Bank.create({
    agency: AGENCY_NUMBER,
    account: ACCOUNT_NUMBER,
    account_type: CC_OR_CP,
    bank: BANK_NUMBER,
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#adicionar-domicilio-bancario
### Index
```ruby  
IuguSimple::Bank.index(ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#verificar-envio-de-domic%C3%ADlio-banc%C3%A1rio
## Transfer
### Create
```ruby  
IuguSimple::Transfer.create({
    receiver_id: ACCOUNT_ID,
    amount_cents: AMOUNT_CENTS
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#transferir-valor
## Withdrawal
### Create
```ruby  
IuguSimple::Withdrawal.create(ACCOUNT_ID, {
    amount: AMOUNT
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation: https://dev.iugu.com/v1.0/reference#pedido-de-saque

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/simple_iugu.
