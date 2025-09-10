SECTIONS
{
  /* Text/code section */
  .text :
  {
    *(.text)
    *(.text.*)
  }

  /* Read-only data (constants, vtables, etc.) */
  .rodata :
  {
    *(.rodata)
    *(.rodata.*)
  }

  /* Data section (initialized globals) */
  .data :
  {
    *(.data)
    *(.data.*)
  }

  /* BSS section (uninitialized globals) */
  .bss :
  {
    *(.bss)
    *(COMMON)
  }

  /* Dynamic linking information (required for .so) */
  .dynamic :
  {
    *(.dynamic)
  }

  /* Dynamic symbol table */
  .dynsym :
  {
    *(.dynsym)
  }

  /* Dynamic string table */
  .dynstr :
  {
    *(.dynstr)
  }

  /* Relocation sections (needed for position independence) */
  .rela.dyn :
  {
    *(.rela.dyn)
  }
  .rela.plt :
  {
    *(.rela.plt)
  }

  /* Procedure Linkage Table (PLT) and Global Offset Table (GOT) */
  .plt :
  {
    *(.plt)
  }
  .got :
  {
    *(.got)
    *(.igot)
  }
}

