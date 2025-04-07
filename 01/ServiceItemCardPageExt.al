#region CRID144 - 12032025-FIN-Automatic guarantee date
pageextension 50600 ServiceItemCardPageExt extends "Service Item Card"
{
    layout
    {
        addlast(General)
        {
            field("ILE Lookup Entry No."; Rec."ILE Lookup Entry No.")
            {
                Caption = 'Entry No';
                ApplicationArea = All;
                ToolTip = 'Select the original sales entry to retrieve warranty information.';
            }
            field("Selected Serial No."; Rec."Selected Serial No.")
            {
                Caption = 'Serial No';
                ApplicationArea = All;
                ToolTip = 'Displays the Serial Number from the selected sales entry.';
            }
            field("Warranty Date"; Rec."Warranty Date")
            {
                Caption = 'Warranty Ending Date';
                ApplicationArea = All;
                ToolTip = 'Displays the Warranty Date from the selected sales entry.';
            }

        }
    }
}
#endregion