using SalesService from './sales-service';

annotate SalesService.SalesOrders with @(

    UI.DataPoint #StatusDP : {
        Value : Status,
        Criticality : Criticality
    },

    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : SalesOrderID,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : CustomerName,
            ![@UI.Importance] : #High
        },
        {
            $Type : 'UI.DataField',
            Value : TotalAmount
        },
        {
            $Type : 'UI.DataField',
            Value : Currency
        },
        {
            $Type : 'UI.DataFieldForAnnotation',
            Target : '@UI.DataPoint#StatusDP'
        }
    ]

);
