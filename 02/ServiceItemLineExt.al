// مثال: اگر فیلد جدیدی به نام MyNewField به Service Item Line اضافه می‌کنید
tableextension 50603 ServiceItemLineExt extends "Service Item Line" // Table 5902
{
    fields
    {
        field(50100; "Entry No"; Integer)
        {
            Caption = 'Entry No';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."ILE Lookup Entry No." where("No." = field("Service Item No.")));

        }

        field(50102; "Warranty Ending Date"; Date)
        {
            Caption = 'Warranty Ending Date';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."Warranty Date" where("No." = field("Service Item No.")));
        }


        field(50101; "Selected Serial No. from SI"; Code[50])
        {
            Caption = 'Selected Serial No. (from Service Item)';
            FieldClass = FlowField;
            CalcFormula = lookup("Service Item"."Selected Serial No." where("No." = field("Service Item No.")));
        }
    }
}