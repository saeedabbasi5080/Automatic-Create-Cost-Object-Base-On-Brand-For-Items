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
                ToolTip = 'This is the tooltip for my new field.';
                Editable = false;
                DrillDown = false;
            }

            field("Serial No"; Rec."Selected Serial No. from SI")
            {
                ApplicationArea = All;
                Caption = 'Serial No';
                ToolTip = 'Shows the base description from the Item table.';
                Editable = false;
                DrillDown = false;
            }


            field("Warranty Ending Date"; Rec."Warranty Ending Date")
            {
                ApplicationArea = All;
                Caption = 'Warranty Ending Date';
                ToolTip = 'Shows the base description from the Item table.';
                Editable = false;
                DrillDown = false;
            }
        }
    }
}
#endregion