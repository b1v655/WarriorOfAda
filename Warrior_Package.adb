
	package body Warrior_Package is
		procedure Init(param: in out Warrior) is
		begin
			Inventory_bag.empty(param.inventory);
			for i in Resource'Range loop
				Inventory_bag.add(param.inventory,i);
			end loop;
		end Init;
		
		procedure Fight(param1: in out warrior; param2: in Obstacle) is
		begin
			if Inventory_bag.has_any(param1.inventory,Tool(param2)) then
				Inventory_bag.remove(param1.inventory,Tool(param2));
			else 
				param1.status:=false;
			end if;
		end Fight;
		
		procedure Collect(param1: in out Warrior;param2: in out Resource) is
		begin 
			Inventory_bag.add(param1.inventory,param2);
		end Collect;
		
		function Is_Alive(param: Warrior) return boolean is
		begin
			return param.status=true;
		end Is_Alive;
		
	end Warrior_Package;
