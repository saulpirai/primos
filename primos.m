
printf("--- GENERADOR DE CLAVE RSA (SIMULADO) ---\n");

% 1. Entrada de datos por el usuario
p = input("Introduce el primer número primo (p): ");
q = input("Introduce el segundo número primo (q): ");

% 2. Validación: ¿Son ambos números primos?
if isprime(p) && isprime(q)

    % Operación de cifrado (Fácil)
    N = p * q;
    printf("\n[PROCESO]: Ambos son primos. Generando clave pública...\n");
    printf("Producto N (Clave Pública): %d\n", N);

    % 3. Intento de Factorización (Difícil)
    printf("\n--- INICIANDO ATAQUE DE FUERZA BRUTA ---\n");
    printf("Buscando los factores de %d sin conocer p ni q...\n", N);

    tic; % Iniciar cronómetro
    factor_encontrado = [];

    % Algoritmo de división por tentativa hasta la raíz cuadrada de N
    limite = floor(sqrt(N));
    for i = 2:limite
        if rem(N, i) == 0
            factor_encontrado = [i, N/i];
            break;
        end
    end
    tiempo = toc;

    % 4. Resultados
    if ~isempty(factor_encontrado)
        printf("\n¡ÉXITO! Se ha roto el cifrado.\n");
        printf("Factores descubiertos: %d y %d\n", factor_encontrado(1), factor_encontrado(2));
        printf("Tiempo total de cómputo: %.6f segundos\n", tiempo);
    else
        printf("\nERROR: No se pudieron encontrar los factores (esto no debería pasar si N = p*q).\n");
    end

else
    % Respuesta si el usuario no ingresó primos
    printf("\n[ERROR]: Uno o ambos números no son primos.\n");
    if !isprime(p); printf("- %d no es un número primo.\n", p); end
    if !isprime(q); printf("- %d no es un número primo.\n", q); end
    printf("Por favor, intenta de nuevo con números primos.\n");
end