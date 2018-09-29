/*!
 * @name: gridtree jquery plugin
 * @author: ray zhang
 * @datetime: 2013-06-28
 * @version: 0.2
 *
 * Copyright (c) 2013 Gtmap Ltd. All Rights Reserved.
 *
 * change-log： 
 * 0.1.0.1 	点击根节点会调用showChild
 * 0.1.0.2 	默认显示其子列表的根节点图标显示错误
 * 0.1.1   	添加trigger定义
 * 0.1.2   	添加fetchCallback功能
 * 0.2		添加 listtree 插件，支持 ul 标签
 * 1.0		重构，面向对象风格。支持页面多次使用插件
 * 1.1		隐藏时添加 hide class,而不是 display none;
 * 1.2		data-has-child 支持 '1'
 */
(function ($) {
    "use strict";

    var defaults = {}

        , Tree = function (option, elem) {
        this.options = option;
        this.elem = $(elem);
        this.init();
    };

    Tree.prototype = {
        init: function () {
            var self = this;
            $(self.elem).find('tr,li').each(function () {
                self.renderItem(this);
            });

            $(self.elem).delegate('._treetoggle', 'click', function () {
                self.move($(this).parents('li,tr')[0]);
            });
        }, renderItem: function (item) {
            this.addPrefix(item);
            return item;
        }, parentNumber: function (item) {
            var parentId = $(item).attr('data-parent')
                , num = 0;
            if (parentId) {
                num = num + 1;
                num = num + this.parentNumber($('#' + parentId));
            }
            return num;
        }
        // 1: 有且显示着， 0：没，不需要显示；
        , childrenStatus: function (item) {
            var back = $('[data-parent="' + $(item).attr('id') + '"]').length ? 1 : 0
                , hasChild = $(item).attr('data-has-child');

            hasChild = (hasChild == 'true' || hasChild == '1') ? true : false;

            if (!back && hasChild) {
                back = 2;
            }
            return back;
        }, move: function (item) {
            var id = $(item).attr('id')
                , toggle = $(item).find('._treetoggle')
                , cStatus = this.childrenStatus(item);
            if (toggle.hasClass('gridtree-open')) {
                this.hideChildren(id);
            } else if (toggle.hasClass('gridtree-close')) {
                this.elem.find('[data-parent=' + id + ']').removeClass('hide');
                $(item).find('.gridtree-close').removeClass('gridtree-close').addClass('gridtree-open');
            }
        }, hideChildren: function (id) {
            var self = this;
            this.elem.find('[data-parent=' + id + ']').each(function () {
                $(this).addClass('hide');
                self.hideChildren($(this).attr('id'));
            });
            $('#' + id).find('.gridtree-open').removeClass('gridtree-open').addClass('gridtree-close');
        }, addPrefix: function (item) {
            var blank = "<i class='blank-icon'></i>"
                , open = "<i class='_treetoggle gridtree-open'></i>"
                , close = "<i class='_treetoggle gridtree-close'></i>"
                , cell;

            cell = $(item).children('td:first-child').length ? $(item).children('td:first-child') : $(item).children('a');
            cell.html('<span>' + cell.html() + '</span>');
            if ($(item).attr('data-level') === '1' && $(item).attr('has-children') === 'true')
                cell.prepend(close);
            else
                cell.prepend(blank);

        }
    };

    $.fn.listtree = function (option) {
        this.addClass('_listtree');
        var options = $.extend({}, defaults, option);
        return this.each(function () {
            var tree = $(this).data('tree');
            if (!tree) $(this).data('tree', (tree = new Tree(options, this)));
        });
    };

    $.fn.gridtree = function (option) {
        this.addClass('_gridtree');
        var options = $.extend({}, defaults, option);
        return this.each(function () {
            var tree = $(this).data('tree');
            if (!tree) $(this).data('tree', (tree = new Tree(options, this)));
        });
    }

}(jQuery));