package body Bag_Package  is
	procedure Empty(param: in out Bag) is
	begin	
		param:=(others => Counter'first);
	end Empty;
	procedure Add(param1: in out Bag; param2: in Index) is
	begin
		Param1(param2):=Counter'succ(param1(param2));
	end Add;
	
	procedure Remove(param1: in out Bag; param2: in Index) is
	begin	
		Param1(param2):=Counter'pred(param1(param2));
	end remove;
	
	function Has_Any(param1:Bag; param2:Index) return Boolean is
	begin	
		return Counter'first<param1(param2);
	end Has_Any;
end bag_package;
		