with Bag_Package;

generic 
	type resource is (<>);
	type obstacle is (<>);	
	with function Tool(param:obstacle) return resource;
	
	package Warrior_Package is
	
		type warrior is private;
		
		procedure Init(param: in out Warrior);
		procedure Fight(param1: in out warrior; param2: in Obstacle);
		procedure Collect(param1: in out Warrior;param2: in out Resource);
		function Is_Alive(param: Warrior) return boolean;
		
		private 
		package inventory_bag is new bag_package(resource,Integer);	
		use inventory_bag;
	type Warrior is record
				status:boolean:=true;
				inventory:Bag;
			end record;
	end Warrior_Package;