-- Hello world program

USE STD.TEXTIO.all;

ENTITY hello_world IS
END hello_world;

ARCHITECTURE behaviour OF hello_world IS
BEGIN
	PROCESS
		VARIABLE l : line;
	BEGIN
		write (l, String'("Hello World!"));
		writeline (output, l);
		wait;
	END PROCESS;
END behaviour;
