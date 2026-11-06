-- Description: Este código es la implementación de un contador de 0 a 9 
-- ,dicho contador se incrementa cada segundo.
--
-- Características:
-- Para iniciar el conteo poner a INI a '1'
-- Para detener el conteo poner a INI a '0'
-- Para reiniciar el conteo poner a RESET a '1'
--
-- NOTA: Se puede cambiar el tiempo del conteo modificando la constante RETRASO_FIN
--
----------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Contador is

PORT( CLK 	  : IN  STD_LOGIC;--------------------RELOJ DE LA FPGA A 50MHZ
		INI 	  : IN  STD_LOGIC;--------------------BIT DE INICIO/PARO DEL CONTEO
		RESET   : IN  STD_LOGIC;--------------------BIT DE RESETEO
		DISPLAY : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)--PUERTO QUE SE CONECTA AL DISPLAY DE 7 SEGMENTOS
		);

end Contador;

architecture Behavioral of Contador is

CONSTANT RETRASO_FIN : INTEGER := 49_999_999;-----------CONSTANTE PARA UN RETRASO DE 1 SEGUNDO

SIGNAL RETRASO : INTEGER RANGE 0 TO RETRASO_FIN := 0;---SEÑAL TIPO ENTERO PARA EL RETRASO
SIGNAL CONTADOR_PRINCIPAL : INTEGER RANGE 0 TO 9 := 0;--SEÑAL TIPO ENTERO PARA EL CONTEO

begin

------PROCESO QUE SE ENCARGA DEL CONTEO------------
---------------------------------------------------

PROCESS(CLK)
BEGIN
IF RISING_EDGE(CLK) THEN
	IF RESET = '1' THEN
		RETRASO <= 0;
		CONTADOR_PRINCIPAL <= 0;
	ELSE
		IF INI = '1' THEN
			RETRASO <= RETRASO +1;
				IF RETRASO = RETRASO_FIN THEN
					RETRASO <= 0;
					CONTADOR_PRINCIPAL <= CONTADOR_PRINCIPAL +1;
						IF CONTADOR_PRINCIPAL = 9 THEN
							CONTADOR_PRINCIPAL <= 0;
						END IF;
				END IF;
		END IF;
	END IF;
END IF;
END PROCESS;

end Behavioral;