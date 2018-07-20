with Ada.Text_IO;
with Base;

procedure Main is
begin
   Ada.Text_IO.Put_Line (String (Base.Encode ("toto")));
end Main;
