/* 解决checkbox,textarea和select的jquery的clone方法后值没有复制的问题,这句必需放在 引入的 jquery 后面 */
(function (original) {
  jQuery.fn.clone = function () {
    var result           = original.apply(this, arguments),
        sour_radio     = this.find('radio').add(this.filter('radio')),
        result_radio = result.find('radio').add(result.filter('radio')),
        sour_checkbox     = this.find('checkbox').add(this.filter('checkbox')),
        result_checkbox = result.find('checkbox').add(result.filter('checkbox')),
        sour_textareas     = this.find('textarea').add(this.filter('textarea')),
        result_textareas = result.find('textarea').add(result.filter('textarea')),
        sour_selects       = this.find('select').add(this.filter('select')),
        result_selects   = result.find('select').add(result.filter('select'));

    for (var i = 0, l = sour_radio.length; i < l; ++i) $(result_radio[i]).val($(sour_radio[i]).val());
    for (var i = 0, l = sour_checkbox.length; i < l; ++i) $(result_checkbox[i]).val($(sour_checkbox[i]).val());
    for (var i = 0, l = sour_textareas.length; i < l; ++i) $(result_textareas[i]).val($(sour_textareas[i]).val());
    for (var i = 0, l = sour_selects.length;   i < l; ++i) result_selects[i].selectedIndex = sour_selects[i].selectedIndex;

    return result;
  };
}) 
(jQuery.fn.clone);