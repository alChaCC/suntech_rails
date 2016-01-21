# SuntechRails
### =====================================

## 準備工作

> 以下說明的參數，我均是以測試環境來做說明，你應該要把它改成production參數

這是紅陽金流串接文件，在串接之前請先確保幾個設定是否正確

* 向紅陽申請串接，你會取得

<img src="https://dl.dropboxusercontent.com/u/22307926/open_source_image/suntech_rails/apply_for_api.png">

* 交易回傳網址是否已經設定好

<img src="https://dl.dropboxusercontent.com/u/22307926/open_source_image/suntech_rails/transaction_callback_setting.png">

* 交易密碼是否已設定好

<img src="https://dl.dropboxusercontent.com/u/22307926/open_source_image/suntech_rails/transaction_code.png">

* 新增檔案**config/suntech.yml**

```
production: &default
  web_atm_id: S1512089028
  buy_safe_id: S1512089010
  twentyfour_id: S1512089036
  pay_code_id: S1512089000
  ali_pay_id: S1512089001
  transaction_code: Coool111
  mode: live
  endpoint: https://www.esafe.com.tw/Service/Etopm.aspx
```

## 如何使用

### 0. Gemfile

```
gem "suntech_rails", '~>0.0.2'
```

### 1. **config/application.rb**

```
require 'suntech_rails_payment'
```

### 2. Routes

假設你要串接的

1. controller為 **app/controllers/buysafes_controller.rb**
2. success   處理的action為 'success' 
3. fail      處理的action為 'fail' 
4. 確認收到   處理的action為 'received'

```
resources :buysafes do 
  collection do 
    post 'success'
    post 'fail'
    get 'received'
    get 'form_generator'
  end
end
```

### 3. Controller

假設你要串接的controller為 **app/controllers/buysafes_controller.rb**

假設

```
  skip_before_action :verify_authenticity_token, only: [:success, :fail]
  helper SuntechRails::SuntechRailsHelper

  def success
    SuntechRails::Payment::BuySafe.check(params)
    # 之後做你想要做的事情
  end

  def fail
    SuntechRails::Payment::BuySafe.check(params)
    # 之後做你想要做的事情
  end

  def received
    render :layout => false
  end

  def new
    # 假設這邊你會傳給我，需要遞交的交易資料
    # *表示必給
    buySafePaymentAttributes = {
        "MN" => 金額*,
        "OrderInfo" =>  訂單資訊*,
        "Td" => 你的訂單編號...等等,
        "sna" => 訂購者姓名,
        "sdt" => 消費者電話,
        "email" => 消費者Email,
        "note1" => 備註1,
        "note2" => 備註2,
        "Card_Type" => 空白 or 0信用卡交易、1銀聯卡交易,
        "Country_Type" => 空白 or EN or JIS (EN:英文, JIS: 日文) 
      }
    @payment = SuntechRails::Payment::BuySafe.new(buySafePaymentAttributes)
  end
```

### 4. View

* 假設你是使用received當作接收確認的action，依據文件指出你只需要給他0000，所以view很單純就寫成

**app/views/buysafes/received.html.erb**

```
<%= "0000" %>
```

**app/views/buysafes/new.html.erb**

```
= build_post_form @payment
``` 

### TODO

* WebATM
* 24Pay
* Paycode
* AliPay

This project rocks and uses MIT-LICENSE.