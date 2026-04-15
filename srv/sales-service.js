module.exports = srv => {

    srv.before(['CREATE', 'UPDATE'], 'SalesOrders', req => {
        const status = req.data.Status;

        switch (status) {
            case 'Blocked':
                req.data.Criticality = 1; // Red
                break;
            case 'In Process':
                req.data.Criticality = 3; // Yellow
                break;
            default:
                req.data.Criticality = 2; // Green
        }
    });

};