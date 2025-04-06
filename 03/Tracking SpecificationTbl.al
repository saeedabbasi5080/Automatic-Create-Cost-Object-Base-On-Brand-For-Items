
tableextension 50604 TrackingSpecificationExt extends "Tracking Specification"
{
    fields
    {
        field(50100; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."ILE Lookup Entry No." where("Serial No." = field("Serial No.")));

        }

        field(50102; "Warranty Ending Date"; Date)
        {
            Caption = 'Warranty Ending Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."Warranty Date" where("Serial No." = field("Serial No.")));
        }


        field(50101; "Selected Serial No. from SI"; Code[50])
        {
            Caption = 'Selected Serial No. (from Service Item)';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."Selected Serial No." where("Serial No." = field("Serial No.")));
        }
    }
}