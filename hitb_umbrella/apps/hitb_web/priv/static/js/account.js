// for phoenix_html support, including form and button helpers
// copy the following scripts into your javascript bundle:
// * https://raw.githubusercontent.com/phoenixframework/phoenix_html/v2.10.0/priv/static/phoenix_html.js
$(document).ready(function() {
    // 将jquery的ajax加入到Vue对象中,vue对象里的this.$ajax就相当于是jquery的$.ajax
    Vue.prototype.$ajax = $.ajax;
    const BASE_URL = '/api';
    // console.log(Vue)
    // 整个页面就是一个Vue对象,将所有属性都放到data里,将所有function都放到methods里
    const common = new Vue({
      el: '#page',
      created: function() {
        this.getTransactions()
      },
      data: {
        type : 'index',
        items: [],
        currentTime: new Date().toLocaleString(),
        username: 'someone manual strong movie roof episode eight spatial brown soldier soup motor',
        transactions: []
      },
      methods: {
        getTransactions: function() {
          this.$ajax({
            type: 'GET',
            url: BASE_URL + '/getTransactions',
            dataType: 'json',
            success: (res)=> {
              this.transactions = res.data
              console.log(res.data[0])
            },
            error: (err)=> {
              this.items = ['登录失败']
              console.log(err);
            }
          });
        }
      }  // vue-methods
    })  // new-Vue
  });  // jquery-ready
