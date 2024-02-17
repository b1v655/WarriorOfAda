
Generic
	type Field is (<>);
	type Warrior is private;
	with procedure Field_Action(param1: in out Field;param2: in out Warrior);
	Empty: in Field; 
	package Map_Package is 
		type coord is private;
		type map(n:positive)is private; 
		
		
		procedure Init(param: in out Map);
		procedure Put(param: in Map);
		procedure Move(param1: in out Map;param2: in out warrior);
		function Is_Empty(Param: Map) return boolean;
		private
			type coord is record
				x:positive;
				y:positive;
			end record;
			type fieldmatrix is array(positive range <>,positive range<>) of field;
			type Map(n:positive) is record
				Fields: fieldmatrix(1..n,1..n);
				Position:Coord:=(1,1);
			end record;
	end Map_Package;
	
	-- begzh.txt