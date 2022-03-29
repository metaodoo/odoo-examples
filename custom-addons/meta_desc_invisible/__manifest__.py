# -*- coding: utf-8 -*-
{
    'name': "Description Field Hide",

    'summary': """
        Hides description fields in SO line and invoice Line
        Changes Sequence in Inventory Stock Picking
        """,

    'description': """
        Hides description fields in SO line and invoice Line
        Changes Sequence in Inventory Stock Picking
    """,


    'author': "Metamorphosis Ltd.",
    'website': "https://metamorphosis.com.bd",

    # Categories can be used to filter modules in modules listing
    # Check https://github.com/odoo/odoo/blob/14.0/odoo/addons/base/data/ir_module_category_data.xml
    # for the full list
    'category': 'View/Modification',
    'version': '14.0.1',

    # any module necessary for this one to work correctly
    'depends': ['base','account','sale','stock'],

    # always loaded
    'data': [
        'views/account_move_form.xml',
        'views/sale_order_form.xml',
        'views/stock_picking_form.xml',
    ],

}
