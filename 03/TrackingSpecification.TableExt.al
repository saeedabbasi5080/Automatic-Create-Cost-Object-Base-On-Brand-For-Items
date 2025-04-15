

#region CRID144 - 12032025-FIN-Automatic guarantee date
tableextension 50604 TrackingSpecificationTblExt extends "Tracking Specification"
{
    fields
    {
        field(50100; "Entry No"; Integer)
        {
            Caption = 'Entry No';
        }


        field(50101; "Serial Number"; Code[50])
        {
            Caption = 'Serial Number';
        }
    }
}
#endregion