var cheerio = require('cheerio');
var iconv = require('iconv-lite')
var http = require("http");
var colors = require('colors');
function main(){
    var options = {  
        host:'tools.2345.com',  
        port:80,  
        path:'/rili.htm'  
    };  
      
    var html = "";//http获取html字符串  
    http.get(options, function (res) {  
        res.setEncoding('binary');//or hex  
        res.on('data',function (data) {//加载数据,一般会执行多次  
            html += data;  
        }).on('end', function () {  
            html=iconv.decode(new Buffer(html,'binary'), 'GBK');//把gbk编码转换成  
            $ = cheerio.load(html);
            console.log("*********************今天的日历*******************".magenta)
            console.log("=====================================================".yellow)
            console.log(($("#info_all").text()).green)  
            console.log(($("#info_nong").text()).rainbow)
            console.log(($("#info_chang").text()).green)
            console.log("=====================================================".yellow)   
        })  
    });  
}

module.exports = main;