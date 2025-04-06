pageextension 50603 ServiceItemWorksheetExt extends "Service Order Subform" // Page 5910
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

    // var
    //     ItemRec: Record "Service Item Line"; // متغیر برای نگهداری رکورد Item
    //                                          // MyFieldIsVisible: Boolean; // مثال برای کنترل نمایش

    // trigger OnAfterGetRecord()
    // begin

    //     if Rec."Entry No" <> 0 then begin
    //         if ItemRec.Get(Rec."Entry No") then begin

    //         end
    //         else begin
    //             Clear(ItemRec); // پاک کردن متغیر اگر آیتم یافت نشد
    //         end;
    //     end
    //     else begin
    //         Clear(ItemRec);
    //     end;

    //     // مثال برای کنترل نمایش
    //     // MyFieldIsVisible := (Rec."Response Date" <> 0D); // مثلاً فیلد ما فقط وقتی تاریخ پاسخ وجود دارد نمایش داده شود
    // end;
}