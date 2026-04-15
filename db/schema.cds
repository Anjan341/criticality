namespace my.sales;

using { managed } from '@sap/cds/common';

/**
 * Sales Order Header
 */
entity SalesOrderHeader : managed {
    key ID           : UUID @default: uuid;

    SalesOrderID     : String(10);
    CustomerName     : String(100);
    TotalAmount      : Decimal(15,2);
    Currency         : String(5);
    Status           : String(20);

    // 1=Error (Red), 2=Warning (Orange), 3=Success (Green)
    Criticality      : Integer;

    Items : Composition of many SalesOrderItem
        on Items.SalesOrderID = SalesOrderID;
}

/**
 * Sales Order Item
 */
entity SalesOrderItem : managed {
    key ID           : UUID @default: uuid;

    SalesOrderID     : String(10);

    ItemPosition     : Integer;
    ProductName      : String(100);
    Quantity         : Integer;
    Price            : Decimal(15,2);
}