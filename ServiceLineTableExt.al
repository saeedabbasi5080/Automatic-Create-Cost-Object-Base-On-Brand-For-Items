tableextension 50601 ServiceLineExt extends "Service Line"
{
    fields
    {
        // You might not need to store Serial No. and Warranty Date here directly
        // if the goal is just to update the Expiration Date.
        // However, if you need them for other purposes:
        field(50100; "Warranty Date"; Date)
        {
            Caption = 'Warranty Date';
            DataClassification = CustomerContent;
            Editable = false;
        }
        // Add Serial No. if needed
        // field(50101; "Serial No."; Code[50])
        // {
        //     Caption = 'Serial No.';
        //     DataClassification = CustomerContent;
        //     Editable = false;
        // }

        // We will use the existing "Expiration Date" field.
    }
}