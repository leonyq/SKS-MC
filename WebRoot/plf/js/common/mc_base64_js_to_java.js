/**
 * _McBase64JsToJava 编码
 */
function _McBase64JsToJava(){}
_McBase64JsToJava.prototype = {
  eChars : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/",
  dChars : new Array(
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 
    -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, -1, 62, -1, -1, -1, 63, 
    52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -1, -1, -1, -1, -1, -1, 
    -1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 
    15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -1, -1, -1, -1, -1, 
    -1, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 
    41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -1, -1, -1, -1, -1),
    
    e : function(str){
    var out, i, len;
    var c1, c2, c3;
    
    str = escape(str);//字符编码以前先用escape()转成非中文字符再进行编码，解码时用unescape()即可得到原来的字符。
    
    len = str.length;
    i = 0;
    out = "";
    while(i < len) {
      c1 = str.charCodeAt(i++) & 0xff;
      if(i == len){
          out += this.eChars.charAt(c1 >> 2);
          out += this.eChars.charAt((c1 & 0x3) << 4);
          out += "==";
          break;
      }
      c2 = str.charCodeAt(i++);
      if(i == len){
          out += this.eChars.charAt(c1 >> 2);
          out += this.eChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
          out += this.eChars.charAt((c2 & 0xF) << 2);
          out += "=";
          break;
      }
      c3 = str.charCodeAt(i++);
      out += this.eChars.charAt(c1 >> 2);
      out += this.eChars.charAt(((c1 & 0x3)<< 4) | ((c2 & 0xF0) >> 4));
      out += this.eChars.charAt(((c2 & 0xF) << 2) | ((c3 & 0xC0) >>6));
      out += this.eChars.charAt(c3 & 0x3F);
    }
    return out;
    },
  
    d : function(str){
    var c1, c2, c3, c4;
    var i, len, out;
    
    len = str.length;
    i = 0;
    out = "";
    while(i < len) {
      /* c1 */
      do {
          c1 = this.dChars[str.charCodeAt(i++) & 0xff];
      } while(i < len && c1 == -1);
      if(c1 == -1)
          break;
      
      /* c2 */
      do {
          c2 = this.dChars[str.charCodeAt(i++) & 0xff];
      } while(i < len && c2 == -1);
      if(c2 == -1)
          break;
      
      out += String.fromCharCode((c1 << 2) | ((c2 & 0x30) >> 4));
      
      /* c3 */
      do {
          c3 = str.charCodeAt(i++) & 0xff;
          if(c3 == 61)
          return out;
          c3 = this.dChars[c3];
      } while(i < len && c3 == -1);
      if(c3 == -1)
          break;
      
      out += String.fromCharCode(((c2 & 0XF) << 4) | ((c3 & 0x3C) >> 2));
      
      /* c4 */
      do {
          c4 = str.charCodeAt(i++) & 0xff;
          if(c4 == 61)
          return out;
          c4 = this.dChars[c4];
      } while(i < len && c4 == -1);
      if(c4 == -1)
          break;
      out += String.fromCharCode(((c3 & 0x03) << 6) | c4);
    }
    
    out = unescape(out);
    return out;
  },
  /** 
  * Yovae.com 
  */ 
  utf16to8 : function(str){
    var out, i, len, c;
    out = "";
    len = str.length;
    for(i = 0; i < len; i++) {
      c = str.charCodeAt(i);
      if ((c >= 0x0001) && (c <= 0x007F)) {
        out += str.charAt(i);
      } else if (c > 0x07FF) {
        out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));
        out += String.fromCharCode(0x80 | ((c >> 6) & 0x3F));
        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
      } else {
        out += String.fromCharCode(0xC0 | ((c >> 6) & 0x1F));
        out += String.fromCharCode(0x80 | ((c >> 0) & 0x3F));
      }
    }
    return out;
  },
  utf8to16 : function(str) {
    var out, i, len, c;
    var char2, char3;
    out = "";
    len = str.length;
    i = 0;
    while(i < len) {
      c = str.charCodeAt(i++);
      switch(c >> 4)
      {
        case 0: case 1: case 2: case 3: case 4: case 5: case 6: case 7:
          //0xxxxxxx
          out += str.charAt(i-1);
          break;
        case 12: case 13:
          //110x xxxx 10xx xxxx
          char2 = str.charCodeAt(i++);
          out += String.fromCharCode(((c & 0x1F) << 6) | (char2 & 0x3F));
          break;
        case 14:
          //1110 xxxx 10xx xxxx 10xx xxxx
          char2 = str.charCodeAt(i++);
          char3 = str.charCodeAt(i++);
          out += String.fromCharCode(((c & 0x0F) << 12) |
          ((char2 & 0x3F) << 6) |
          ((char3 & 0x3F) << 0));
        break;
      }
    }
    return out;
  },
  /*****************************************************************************
   * 函数编写： getMcDealBase64Encode(mcCsval)
   * 函数名称： mc平台处理参数值加密
   * 作用： js端加密，java解密
   * creater： cjdjk
   * creater_time: 2018-07-05 11:27
   * updater:cjdjk
   * updater_time: 2018-07-05  11:27
   *  
   * 例子：
   *   _McBase64JsToJava.getMcDealBase64Encode(langs);
   ******************************************************************************************/
  getMcDealBase64Encode :function (mcCsval){ 
    mcCsval = this.utf16to8(mcCsval);
    mcCsval =this. e(mcCsval);
    return mcCsval;
  }//function getMcDealBase64(mcCsval){
};
var _mcBase64JsToJava = new _McBase64JsToJava();
