#region CRID144 - 12032025-FIN-Automatic guarantee date
pageextension 50603 ServiceItemWorksheetPgeExt extends "Service Order Subform"
{
    layout
    {

        addlast(Control1)
        {
            field("Entry No"; Rec."Entry No")
            {
                ApplicationArea = All;
                Caption = 'Entry No';
                Editable = false;
                DrillDown = false;
            }

            field("Serial Number"; Rec."Serial Number")
            {
                ApplicationArea = All;
                Caption = 'Serial Number';
                Editable = false;
                DrillDown = false;
            }


            field("Last Warranty Date"; Rec."Last Warranty Date")
            {
                ApplicationArea = All;
                Caption = 'Last Warranty Date';
                Editable = false;
                DrillDown = false;
            }
        }
    }
}
#endregion