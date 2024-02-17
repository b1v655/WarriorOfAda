with ada.Text_io;
with map_package;
with warrior_package;
procedure simulation is
type Field is (Empty,Stone,Wood,Sword,Water,Trap,Enemy);
subtype Resource is Field Range stone..sword;
subtype Obstacle is Field range water..enemy;
function Tool(param:obstacle) return resource is
r:resource;
begin 
	if param=water then
		r:=stone;
	end if;
	if param=Trap then
		r:=Wood;
	end if;
	if param=enemy then
		r:=sword;
	end if;
	return r;
end Tool;
package Kampfer is new warrior_package(resource,obstacle,tool); 
procedure field_action(param1:in out Field;param2:in out Kampfer.Warrior) is
begin
	if param1=stone or param1=sword or param1=wood then
		ada.text_io.put_line("Talalt valami kacatot.");
		kampfer.collect(param2,param1);
	end if;
	if param1=water or param1=trap or param1=enemy then
		ada.text_io.put_line("Hajra Joska, ami nem ol meg, megerosit!");
		kampfer.Fight(param2,param1);
	end if;
	if kampfer.is_alive(param2) then
		param1:=empty;
	end if;
end;
package Landkarte is new map_package(field,Kampfer.Warrior,field_action,Empty);
Joska:Kampfer.warrior;
n:string(1..10);
h:integer;
begin
	ada.text_io.put_line("Mekkora legyen a palya?");
	ada.text_io.get_line(n,h);
	declare
	Land:Landkarte.map(Integer'Value(n(1..h)));
	begin
		kampfer.init(Joska);
		Landkarte.init(Land);
		while kampfer.is_alive(Joska) and not Landkarte.is_Empty(Land) loop
			Landkarte.move(Land,Joska);
			Landkarte.put(Land);
		end loop;
		if not kampfer.is_alive(Joska) then
			ada.text_io.put_line("DEFEAT: Joska megpusztult.");
		end if;
		if Landkarte.is_Empty(Land) then
			ada.text_io.put_line("VICTORY: viheti a kiraly lanyat!");
		end if;
	end;
	exception
		when Constraint_Error=>ada.text_io.put_line("Ertelmes pozitiv szamot irjal be!");
end simulation;