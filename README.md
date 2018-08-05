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

Add this to simple_iugu.rb Initializer:
```ruby
SimpleIugu.api_key = YOUR_LIVE_API_TOKEN
SimpleIugu.api_key_test = YOUR_TEST_API_TOKEN
SimpleIugu.iugu_account_id = YOUR_ACCOUNT_ID
SimpleIugu.is_test = TRUE_OR_FALSE
```


## Customer
### Create    
```ruby  
SimpleIugu::Customer.create({
    email: 'email@example.com',
    name: 'example'
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#testinput-2
### Update
```ruby  
SimpleIugu::Customer.update(CUSTOMER_ID, {
    email: 'email@example.com',
    name: 'example'
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#alterarr
### Destroy
```ruby  
SimpleIugu::Customer.delete(CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#remover-1
### Index
```ruby  
SimpleIugu::Customer.index(ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#listar-1
### Show
```ruby  
SimpleIugu::Customer.show(CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#

## Payment Token
### Create
```ruby  
SimpleIugu::PaymentToken.create({
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
    Documentation https://dev.iugu.com/v1.0/reference#testinput

## Payment Method
### Create
```ruby  
SimpleIugu::PaymentMethod.create(customer_id: CUSTOMER_ID,{
    description: 'My credit card',
    token: PAYMENT_TOKEN,
    set_as_default: TRUE_OR_FALSE
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#testinput-3
### Update
```ruby  
SimpleIugu::PaymentMethod.update(customer_id: CUSTOMER_ID, id: ID, {
    description: 'My credit card',
    set_as_default: TRUE_OR_FALSE
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#alterar
### Destroy
```ruby  
SimpleIugu::PaymentMethod.delete(customer_id: CUSTOMER_ID, id: ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#remover-2
### Show
```ruby  
SimpleIugu::PaymentMethod.show(customer_id: CUSTOMER_ID, id: ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#testinput-4
### Index
```ruby  
SimpleIugu::PaymentMethod.index(customer_id: CUSTOMER_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#listar-2

## Invoice
### Create
```ruby  
SimpleIugu::Invoice.create({
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
    Documentation https://dev.iugu.com/v1.0/reference#criar-fatura
### Duplicate
```ruby  
SimpleIugu::Invoice.duplicate(INVOICE_ID, {
    due_date: "AAA-MM-DD"
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#gerar-segunda-via
### Capture
```ruby  
SimpleIugu::Invoice.capture(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#capturar-fatura
### Show
```ruby  
SimpleIugu::Invoice.show(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#detalhes
### Index
```ruby  
SimpleIugu::Invoice.index({
    limit: 50
}, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#listar-faturas
### Cancel
```ruby  
SimpleIugu::Invoice.cancel(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#cancelar
### Refund
```ruby  
SimpleIugu::Invoice.refund(INVOICE_ID, ACCOUNT_ACCESS_TOKEN)
```
    Documentation https://dev.iugu.com/v1.0/reference#reembolsar-fatura
## Charge
### Create
```ruby  
SimpleIugu::Charge.create({
    customer_payment_method_id: CUSTOMER_PAYMENT_METHOD
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#cobranca-direta
## Sub Account
### Create
```ruby  
SimpleIugu::SubAccount.create({
    name: PARTNER_NAME,
    comission: {
        percent: SOME_PERCENT
    }
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#criar-conta
### Verify
```ruby  
SimpleIugu::SubAccount.verify(IUGU_ACCOUNT_ID, {
    data: {
    }
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#enviar-verificacao-de-conta
### Update
```ruby  
SimpleIugu::SubAccount.update({
    name: OTHER_NAME
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#configurar-conta
### Show
```ruby  
SimpleIugu::SubAccount.show(IUGU_ACCOUNT_ID, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#informacoes-da-conta
### Index
```ruby  
SimpleIugu::SubAccount.index({
    limit: 50
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#listar-as-contas
## Bank
### Create
```ruby  
SimpleIugu::Bank.create({
    agency: AGENCY_NUMBER,
    account: ACCOUNT_NUMBER,
    account_type: CC_OR_CP,
    bank: BANK_NUMBER,
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#adicionar-domicilio-bancario
### Index
```ruby  
SimpleIugu::Bank.index(ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#verificar-envio-de-domic%C3%ADlio-banc%C3%A1rio
## Transfer
### Create
```ruby  
SimpleIugu::Transfer.create({
    receiver_id: ACCOUNT_ID,
    amount_cents: AMOUNT_CENTS
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#transferir-valor
## Withdrawal
### Create
```ruby  
SimpleIugu::Withdrawal.create(ACCOUNT_ID, {
    amount: AMOUNT
}, ACCOUNT_ACCESS_TOKEN)
```
     Documentation https://dev.iugu.com/v1.0/reference#pedido-de-saque

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/henriqjanuario/simple_iugu.
