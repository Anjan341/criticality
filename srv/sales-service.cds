using { my.sales as db } from '../db/schema';

service SalesService {

    @UI.HeaderInfo: {
        TypeName: 'Sales Order',
        TypeNamePlural: 'Sales Orders',
        Title: { Value: SalesOrderID },
        Description: { Value: CustomerName }
    }

    entity SalesOrders as projection on db.SalesOrderHeader;

    entity SalesOrderItems as projection on db.SalesOrderItem;
}
