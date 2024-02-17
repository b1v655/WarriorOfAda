Generic 
	type Index is (<>);
	type Counter is (<>);
	package Bag_Package is
		type bag is private;
		procedure Empty(param: in out Bag);
		procedure Add(param1: in out Bag; param2: in Index);
		procedure Remove(param1: in out Bag; param2: in Index);
		function Has_Any(param1:Bag; param2:Index) return Boolean;
		private
			type Bag is array(Index) of Counter;
	end bag_package;
		
		
		
		