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

    // Criticality: 1=Red, 2=Green, 3=Yellow
    Criticality      : Integer;

    Items : Composition of many SalesOrderItem
            on Items.parent = $self;
}

/**
 * Sales Order Item
 */
entity SalesOrderItem : managed {
    key ID           : UUID @default: uuid;

    parent           : Association to SalesOrderHeader;

    ItemPosition     : Integer;
    ProductName      : String(100);
    Quantity         : Integer;
    Price            : Decimal(15,2);
}