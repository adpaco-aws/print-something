goto-cc --function public print_something-*.symtab.out std-6f6765f9f8cb8a58.symtab.out /home/ubuntu/rmc-dash/library/rmc/rmc_lib.c -o print_something.goto
goto-instrument --add-library print_something.goto print_something.goto
goto-instrument --generate-function-body-options assert-false --generate-function-body '.*' --drop-unused-functions print_something.goto print_something.goto
goto-instrument --show-goto-functions print_something.goto > print_something.gf # not needed, just good for debugging
cbmc --bounds-check --pointer-check --pointer-primitive-check --conversion-check --div-by-zero-check --float-overflow-check --nan-check --pointer-overflow-check --signed-overflow-check --undefined-shift-check --unsigned-overflow-check --unwinding-assertions --object-bits 16 --unwind 2 --function public print_something.goto &> cbmc.log
