// pageextension 50601 saeedext extends "Service Order Subform"
// {
//     layout
//     {

//         addafter("Line No.")
//         field("saeed"; Rec."Item No.")
//         {
//             ApplicationArea = all;
//             Caption = 'dsffgdggfg'
//         }
//     }
// }

// page 50610 "My Service Item Lines Part"
// {
//     PageType = ListPart;
//     SourceTable = "Service Item Line"; // جدول منبع: Service Item Line
//     Editable = false; // کل پارت فقط خواندنی باشد

//     layout
//     {
//         area(Content)
//         {
//             repeater(General)
//             {
//                 // فیلدهایی که می‌خواهیم از Service Item Line نمایش دهیم
//                 field("Service Item No."; Rec."Service Item No.")
//                 { ApplicationArea = All; }
//                 field(Description; Rec.Description) { ApplicationArea = All; }
//                 field("Serial No."; Rec."Serial No.") { ApplicationArea = All; }
//                 // ... سایر فیلدهای مورد نیاز
//             }
//         }
//     }
// }