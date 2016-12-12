pde_t *d;
pte_t *pte;
uint pa, i, flags;
char *mem;

d = setupkvm();

for(i = 0; i < sz; i += PGSIZE){
if((pte = walkpgdir(pgdir, (void *) i, 0)) == 0)
panic("copyuvm: pte should exist");
if(!(*pte & PTE_P))
panic("copyuvm: page not present");
pa = PTE_ADDR(*pte);
flags = PTE_FLAGS(*pte);
if((mem = kalloc()) == 0)
goto bad;
memmove(mem, (char*)p2v(pa), PGSIZE);
if(mappages(d, (void*)i, PGSIZE, v2p(mem), flags) < 0)
goto bad;
}
return d;

bad:
freevm(d);
return 0;
