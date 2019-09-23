var form = {
    // 序列化表单成json对象
    serialize : function(frm) {
        var json = {};
        frm = frm || $('body');
        if (!frm) {
            return json;
        }
        var groups = frm.find('div[fieldset]'), jsonGroup = this
                ._serializeGroups(groups), inputs = frm
                .find('input[type!=button][type!=reset][type!=submit][type!=image],select,textarea'), json = this
                ._serializeInputs(inputs);

        for ( var key in jsonGroup) {
            json[key] = jsonGroup[key];
        }
        return json;
    },
    /**
     * 在分组中查找 fieldset (如：fieldset="user")开头的数据域。
     * 
     * @method _serializeGroups
     * @param {Array}
     *            groups 输入框分组容器集合
     * @return {Object} json 对象 {key:value,...}
     */
    _serializeGroups : function(groups) {
        var json = {};
        if (!groups) {
            return json;
        }
        for ( var i = groups.length - 1; i >= 0; i--) {
            var group = $(groups[i]), key = group.attr('fieldset');
            if (!key) {
                continue;
            }
            var inputs = group
                    .find('input[type!=button][type!=reset][type!=submit],select,textarea');
            json[key] = this._serializeInputs(inputs);
            // 添加序列化标记
            inputs.addClass('_isSerialized');
        }
        return json;
    },
    /**
     * 将输入控件集合序列化成对象， 名称或编号作为键，value属性作为值。
     * 
     * @method _serializeInputs
     * @param {Array}
     *            inputs input/select/textarea的对象集合
     * @return {Object} json 对象 {key:value,...}
     */
    _serializeInputs : function(inputs) {
        var json = {};
        if (!inputs) {
            return json;
        }
        for ( var i = inputs.length - 1; i >= 0; i--) {
            var input = $(inputs[i]), type = input.attr('type');
            if (type) {
                type = type.toLowerCase();
            }
            var tagName = input.get(0).tagName, id = input.attr('id'), name = input
                    .attr('name'),textVal=input.attr('textVal'),value = null;

            // 判断输入框是否已经序列化过
            if (input.hasClass('_isSerialized')
                    || (typeof id == 'undefined' && typeof name == 'undefined')) {
                continue;
            }

            // input输入标签
            if (tagName == 'INPUT' && type) {
                switch (type) {
                case 'checkbox': {
                    value = input.is(':checked');
                }
                    break;
                case 'radio': {
                    if (input.is(':checked')) {
                        value = input.attr('value');
                    } else {
                        continue;
                    }
                }
                    break;
                default: {
                    value = input.val();
                }
                }
            } else {
                // 非input输入标签，如：select,textarea
                value = input.val();
            }

            json[name || textVal || id  ] = value;
            // 清除序列化标记
            input.removeClass('_isSerialized');
        }
        return json;
    },
    /**
     * 查找符合条件的输入标签。
     * 
     * @method _findInputs
     * @param {Array}
     *            inputs jQueery输入标签数组
     * @param {String}
     *            key 查询关键字
     * @return {Array} inputs jQuery对象数组
     */
    _findInputs : function(inputs, key) {
        return $(inputs.filter("input[name='" + key + "'],input[id='" + key
                + "'],input[textVal='" + key + "'],textarea[name='" + key + "'],textarea[id='" + key
                + "'],select[name='" + key + "'],select[id='" + key + "']"));
    },
    /**
     * 获取合法的输入标签。
     * 
     * @method _filterInputs
     * @param {Object}
     *            container jQuery对象，标签容器
     * @return {Array} inputs jQuery对象数组
     */
    _filterInputs : function(container) {
        return $(container
                .find('input[type!=button][type!=reset][type!=submit][type!=image][type!=file],select,textarea'));
    },
    /**
     * 填充表单内容：将json数据形式数据填充到表单内，最多解析两层json结构。
     * 
     * @method deserialize
     * @param {Object}
     *            frm jQuery表单对象（或其它容器标签对象，如：div）
     * @param {Object}
     *            json 序列化好的json数据对象，最多只包含两层嵌套
     */
    deserialize : function(frm, json, uuid) {
        frm = frm || $('body');
        if (!frm || !json) {
            return this;
        }
        // objects缓存json第一层数据对象;
        // groups缓存json嵌套层数据（第二层），将首先被赋值，以避免覆盖
        var objects = {}, groups = {};

        // 数据分组
        for ( var key in json) {
            var value = json[key];
            if ($.isPlainObject(value)) {
                groups[key] = value;
            } else {
                objects[key] = value;
            }
        }

        var _deserializeInputs = this._deserializeInputs, _filterInputs = this._filterInputs, _findInputs = this._findInputs;

        // 填充嵌套层数据
        for ( var key in groups) {
            var json = groups[key], div = frm.find('div[fieldset="' + key
                    + '"]');
            if (!div.length) {
                continue;
            }
            var inputs = _filterInputs(div);
            if (!inputs.length) {
                continue;
            }
            for ( var k in json) {
                var val = json[k], input = _findInputs(inputs, k);
                _deserializeInputs(input, val);
            }
        }
        // 填充第一层数据
        var inputs = _filterInputs(frm);
        for ( var key in objects) {
            var value = objects[key], input = _findInputs(inputs, key);
            _deserializeInputs(input, value);
        }
        inputs.filter('._isSerialized').removeClass('_isSerialized');
        return this;
    },
    /**
     * 将值填充到输入标签里面。
     * 
     * @method _deserializeInputs
     * @param {Array}
     *            inputs 输入标签集合
     * @param {String/Number}
     *            value 值
     * @return {Object} iTsai.form
     */
    _deserializeInputs : function(inputs, value) {
        if (!inputs && value == null) {
            return this;
        }

        for ( var i = inputs.length - 1; i >= 0; i--) {
            var input = $(inputs[i]);
            // 判断输入框是否已经序列化过
            if (input.hasClass('_isSerialized')) {
                continue;
            }
            var type = input.attr('type');
            if (type) {
                type = type.toLowerCase();
            }
            if (type) {
                switch (type) {
                case 'checkbox': {
                    input.attr('checked', value);
                }
                    break;
                case 'radio': {
                    input.each(function(i) {
                        var thiz = $(this);
                        if (thiz.attr('value') == value) {
                            thiz.attr('checked', true);
                        }
                    });
                }
                    break;
                default: {
                    input.val(value);
                }
                }
            } else {
                input.val(value);
            }
            input.addClass('_isSerialized');
        }
        return this;
    },
};