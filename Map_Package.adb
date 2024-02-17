with ada.text_io;
With ada.numerics.discrete_random;
package body Map_Package is 
	procedure Init(param: in out Map) is
	package rand is new ada.numerics.discrete_random(field);
	use rand;
	G : generator;
	begin
		reset(G);
		for i in param.fields'range loop
			for j in param.fields'range loop
				param.fields(i,j):=Random(G);
			end loop;
		end loop;
	end init;
	procedure Put(param: in Map) is
	begin
		for i in param.fields'range loop
			for j in param.fields'range loop
				ada.text_io.put(Field'image(param.fields(i,j))&" ");
			end loop;
			ada.text_io.put_line("");
		end loop;
		ada.text_io.put_line("");
	end put;
	procedure Move(param1: in out Map;param2: in out warrior) is
	subtype int is integer range 1..4;
	package rand is new ada.numerics.discrete_random(Int);
	use rand;
	G : generator;
	begin
		reset(G);
		case random(G) is
			when 1 => 	if param1.position.x=param1.fields'last then
							param1.position.x:=param1.fields'first;
						else
							param1.position:=(param1.position.x+1,param1.position.y);
						end if;
			when 2 => 	if param1.position.x=param1.fields'first then
							param1.position.x:=param1.fields'last;
						else
							param1.position:=(param1.position.x-1,param1.position.y);
						end if;
			when 3 => 	if param1.position.y=param1.fields'last then
							param1.position.y:=param1.fields'first;
							
						else
							param1.position:=(param1.position.x,param1.position.y+1);
						end if;
			when 4 => 	if param1.position.y=param1.fields'first then
							param1.position.y:=param1.fields'last;
						else
							param1.position:=(param1.position.x,param1.position.y-1);
						end if;
			when others => null;
		end case;
		field_action(param1.fields(param1.position.x,param1.position.y),param2);
	end move;
	function Is_Empty(Param: Map) return boolean is
	l:boolean:=true;
	i,j:positive;
	begin
		i:=1;
		while i<=param.fields'last and l loop
			j:=1;
			while j<=param.fields'last and l loop
				l:=param.fields(i,j)=empty;
				j:=j+1;
			end loop;
			i:=i+1;
		end loop;
		return l;
	end is_empty;
end Map_Package;