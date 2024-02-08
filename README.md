# README

je implementovana manipulace s usery i jejich login a registrace,
je mozno pridavat, mazat a editovat usery, projekty, tasky
(pri pridani noveho usera pres view users se nastavi heslo na 'password', jinak pri registraci si heslo nastavuje uzivatel)
pridavat a mazat usery muze admin
zobrazovat vse muze jen prihlaseny uzivatel
prihlaseny uzivatel muze upravovat sve ukoly
neprihlaseny uzivatel muze videt pouze home a search (search pro neprihlaseneho uzivatele je nefunkcni)
avatari jsou ulozeni tak ze k nim ma take pristup kdokoli (nevim jestli je to tak spravne)

### odkaz na produkcni verzi:

# http://redmine.qwality.fun

### todo:  
- ~~vytvareni a mazani itemu renderuje celou stranku -> predelat na htmx~~
  - delete navic musi spravne upravit pocet itemu na strance
- ~~strankovani~~
- ~~editace tasku~~
  - ~~pridavani souboru k taskum~~
  - ~~ve formulari editace se pres htmx zobrazi formular pro nove tasky~~
    - vyreseno pres klonovani elementu
  - ~~(smazat accept nested attributes)~~
- ~~predelat na grid a subgrid~~
  - abandoned

### issues:
- ~~pri prvnim loadu stranky nejde klikat na tlacitka (pravdepodobne kvuli htmx)~~
  - opraveno.. jeste to doladim (reinicializuju htmx na celem body, ale asi by stacilo na jednom elementu)
- v produkcni verzi nejde nahravat vice velkych souboru najednou
- nalezen bug kde nonadmin uzivatel nemuze zobrazit moje-projekty (moje-ukoly funguji)
