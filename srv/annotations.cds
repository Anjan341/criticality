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
            Target : '@UI.DataPoint#StatusDP',
            Label : 'CriticalityStatus'
        }
    ]

);
annotate SalesService.SalesOrders with @(

    UI.FieldGroup #GeneralInfo : {
        Data : [
            {
            $Type : 'UI.DataField',
            Value : SalesOrderID,
            Label : 'Sales Order ID'
        },
        {
            $Type : 'UI.DataField',
            Value : CustomerName,
            Label : 'Customer Name'
        }
        ]
    },

    UI.FieldGroup #AmountInfo : {
        Data : [
            { $Type : 'UI.DataField', 
            Value : TotalAmount,
            Label: 'TotalAmount'
             },
            { $Type : 'UI.DataField',
             Value : Currency,
             Label: 'Currency'
              }
        ]
    },

    UI.FieldGroup #StatusInfo : {
        Data : [
            {
                
                $Type : 'UI.DataFieldForAnnotation',
                Target : '@UI.DataPoint#StatusDP'
            }
        ]
    }

);
annotate SalesService.SalesOrders with @(

    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneralInfo'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Amount Details',
            Target : '@UI.FieldGroup#AmountInfo'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Status',
            Target : '@UI.FieldGroup#StatusInfo'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Items',
            Target : 'Items/@UI.LineItem'
        }
    ]

);
annotate SalesService.SalesOrderItems with @(

    UI.LineItem : [
        { $Type : 'UI.DataField', Value : ItemID },
        { $Type : 'UI.DataField', Value : ProductID },
        { $Type : 'UI.DataField', Value : ProductName },
        { $Type : 'UI.DataField', Value : Quantity },
        { $Type : 'UI.DataField', Value : Price }
    ]

);
