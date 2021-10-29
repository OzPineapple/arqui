 .data            # Zona de datos
vector: .word 34 28 1

      .text      # Zona de instrucciones
main: li $v0, 1  # Llamada al sistema para print int
      lw $a0, vector ($0)
      syscall    # Muestra elprimer número en pantalla
      lw $a0, vector + 4($0)
      syscall    # Muestra el segundo número en pantalla
      lw $a0, vector + 8($0)
      syscall    # Muestra eltercer número en pantalla


      li $v0, 10 # Finalizarprograma
      syscall