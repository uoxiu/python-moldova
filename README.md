# Python Moldova Community

Acest repositoriu este un website dezvoltat pe baza generatorului Jekyll și reprezintă pagina oficială a comunității de dezvoltatori Python din Moldova (python.md).

Cu ajutorul acestui repozitoriu se permite ca oricine să dețină posibilitate de adăugare a conținutului pe acest website. Pentru asta e necesar doar să creați un `Pull request` cu noul articol și să fie Merged de un maintainer a repozitoriului.

## 💡 Cum adaug un articol?

1. Pentru început trebuie aveți un cont pe Github și să creați un `Fork` acestui repositoriu în contul dvs
2. Creați o clonă pe computer dvs pentru fork și creați un fișier nou cu denumirea în următorul format `YYYY-MM-DD-title.md` în dosarul `_posts` (luați ca exemplu fișierele deja create)
3. La începutul fișierului creat introduceți următorul bloc și completați cu informația necesară:
```
---
layout: post
title: introduceți aici denumirea articolului
author: introduceți aici numele dvs
short: introduceți aici o scurta descriere
---
```
4. Mai jos de acest bloc introduceți conținutul articolului în format Markdown, pentru simplicitate puteți folosi un editor wysiwyg markdown (spre exemplu: https://stackedit.io/app)
5. Pentru a adăuga o imagine în conținut este necesar de a fi încărcată pe un hosting extern sau în folderul /public/assets/posts cu introducerea căii relative:
```
![denumire imagine](/public/assets/posts/denumirea-imaginii.png)
```
6. Pentru a vizualiza site-ul local este necesar să aveți instalat pe computer Docker (https://www.docker.com/products/docker-desktop) și Docker-compose (https://docs.docker.com/compose/install/)
După instalare rulați această comandă în terminal:
```
docker-compose up --build
```
  și accesați adresa http://127.0.0.1:8080/

7. Pentru a publica articolul pe siteul python.md este necesar să faceți commit & push în repositoriul dvs și să creați un `Pull request` în repositoriul original. După crearea Pull request-ului un Maintainer va revizui modificările pentru a fi publicate pe site, odată ce sunt acceptate se vor publica automat pe website.

## 📑 Reguli de conținut

1. Pe site sunt permise publicarea conținutului doar în limba Română, Rusă și Engleză.
2. Tematica articolului trebuie să fie în mod obligatoriu tangentă cu limbajul Python sau activitatea comunității date.
3. Sunt interzise articole ce conțin: spam, publicitate, limbaj vulgar, abuz, încurajări în utilizarea unor servicii financiare sau jocuri de noroc.
4. În conținutul articolui este permisă posiblitatea de o singură mențiune cu link a companiei unde activați, a blogului personal, a unui profil pe rețele de socializare sau a proiectului la care lucrați.
5. Nu este permisă publicarea unui articol existent pe internet pentru a nu crea dublicare de conținut.
6. Articolul trebuie să fie scris corect gramatical și bine structurat.

## ❤️ Ce articole ar fi iubite de cititorii noștri

1. Ce descriu experiența dvs cu limbajul Python.
2. Care au un caracter educațional (tutorial, how to).
3. Care ajută cititorii să rezolve o problemă anume.
4. Care descriu un instrument de dezvoltare sau un package python.




Vă uram multă inspirație și success!

Pentru mai multe detalii puteți plasa întrebarea dvs pe https://t.me/mpycom sau pe adresa de email community[ at ]python.md.
