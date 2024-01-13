# README

je implementovana manipulace s usery i jejich login a registrace,
je mozno pridavat, mazat a editovat usery
(pri pridani noveho usera pres view users se nastavi heslo na 'password', jinak pri registraci si heslo nastavuje uzivatel)
momentalne neni implementovana jakakoli bezpecnost (pridavat a mazat usery muze admin)
avatari jsou ulozeni tak ze k nim ma take pristup kdokoli (nevim jestli je to tak spravne)
jsou implementovany tasky i projekty, chybi pridavani souboru k taskum

### todo:  
- vyvareni a mazani itemu renderu celou stranku -> predelat na htmx
  - delete navic musi spravne upravit pocet itemu na strance
- strankovani
- editace tasku
  - pridavani souboru k taskum
  - ve formulari editace se pres htmx zobrazi formular pro nove tasky
  - (smazat accept nested attributes)
  - (simple_form_for) ?

### issues:
- pri prvnim loadu stranky nejde klikat na tlacitka (pravdepodobne kvuli htmx)

![Screenshot Users](screenshots/screenshot%20(4).png)
![Screenshot2 Users](screenshots/screenshot%20(1).png)
![Screenshot Users](screenshots/screenshot%20(2).png)
![Screenshot Users](screenshots/screenshot%20(3).png)