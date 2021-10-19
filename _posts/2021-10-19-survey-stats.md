---
layout: post
title: Analiza sondajului din octombrie 2021
author: Nicolae Godina
short: Cu puțin timp în urmă, am făcut un mic referendum în grupul de telegram. A fost un sondaj voluntar și persoanele au dispus de timp, au răspuns la câteva întrebări pentru a identifica interesele comunității. Pentru analiza datelor am decis să folosesc Python, cu toate că nu am abilități excepționale în Data Analysis, dar aș dori să mă împart cu rezultatele obținute.
---

Cu puțin timp în urmă, am făcut un mic referendum în grupul de telegram. A fost un sondaj voluntar și persoanele au dispus de timp, au răspuns la câteva întrebări pentru a identifica interesele comunității. Pentru analiza datelor am decis să folosesc Python, cu toate că nu am abilități excepționale în Data Analysis, dar aș dori să mă împart cu rezultatele obținute.

Avem următoarele date de intrare, care le-am curățit și am corectat greșelile de tapare în câmpul unde nu erau opțiuni de selecție:

```python
data = [
    ('Web development', '3-5 ani', 'Django'), ('Web development', '3-5 ani', 'Django, DRF'),
    ('Web development', '5+ ani', 'FastAPI, Tornado, Django'), ('Web development', '<1 an', 'Django'),
    ('Web development', '5+ ani', 'Django, FastAPI, poetry, requests'), ('Machine learning', '3-5 ani', 'Pandas'),
    ('Web development', '1-3 ani', 'Django, DRF, FastAPI'), ('Data analysis', '1-3 ani', 'Aiogram, bs, peewee'),
    ('Web development', '<1 an', 'Django, DRF'), ('Web development', '5+ ani', 'Django'),
    ('Web development', '<1 an', 'Django'), ('Data analysis', '1-3 ani', 'Spark, Pandas'),
    ('Web development', '3-5 ani', 'FastAPI'), ('Web development', '1-3 ani', 'Flask'),
    ('Web development', '<1 an', 'Django, Flask'), ('Web development', '<1 an', 'Django, Kivi'),
    ('Machine learning', '5+ ani', 'Keras, Tensorflow, sklearn, pandas, matplot, numpy'),
    ('Software testing', '1-3 ani', 'pytest, requests, selenium, robot-framework'),
    ('Software testing', '5+ ani',
     'requests, scapy, pytest, beautifulsoup, json, lxml, IP, pyyaml, logging,  threading, re'),
    ('Web development', '3-5 ani', 'Flask'), ('Web development', '3-5 ani', 'Django'),
    ('Machine learning', '5+ ani', 'Flask, Django, sklearn, Tensorflow, keras'),
    ('Web development', '3-5 ani', 'Flask, Django, DRF, scrapy'),
    ('Machine learning', '5+ ani', ''), ('Web development', '1-3 ani', 'Django'),
    ('Parsing / Scrapping / Crawling', '5+ ani', 'pyautogui, telebot, selenium, nmap, opencv'),
    ('Web development', '<1 an', 'Django'), ('Web development', '<1 an', 'Django'),
    ('Web development', '1-3 ani', 'Flask'), ('Web development', '1-3 ani', 'Django, DRF'),
    ('Web development', '1-3 ani', 'Django, Flask'), ('Web development', '3-5 ani', 'Flask'),
    ('Web development', '1-3 ani', ''), ('Machine learning', '<1 an', 'Tensorflow'),
    ('Web development', '<1 an', 'Flask, asyncio, pydantic'),
    ('Web development', '3-5 ani', '')
]
```

În primul rând hai să vedem câți au completat, folosind `len`

```python
count = len(data)

print(count)
```

> 36

## Domenii

Pentru a afla în ce domenii membrii comunității aplică limbajul Python voi folosi un Pie chart din `matplotlib`

```python
import collections

import matplotlib.pyplot as plt

counter = collections.Counter([d[0] for d in data])

plt.pie(counter.values(), labels=counter.keys(), autopct='%1.1f%%', startangle=210)
plt.axis('equal')
plt.title('În ce domeniu aplici limbajul Python?')
plt.tight_layout(pad=5)
plt.show()
```

![Survey image](/public/assets/posts/survey/survey-1.png)

Nu mă așteptam ca Web development-ul să fie atât de popular, mă gândeam că ponderea la Machine learning va fi mai mare

## Experiența

Acum, să vedem ce experiența au persoanele care au participat în sondaj, e același script doar că folosim counter pentru coloana a doua

```python
import collections

import matplotlib.pyplot as plt

counter = collections.Counter([d[1] for d in data])

plt.pie(counter.values(), labels=counter.keys(), autopct='%1.1f%%', startangle=90)
plt.axis('equal')
plt.title('Ce experiență ai pe Python?')
plt.tight_layout()
plt.show()

```

![Survey image](/public/assets/posts/survey/survey-2.png)

Observăm că în grup avem persoane cu diversa experiență, de la juniori la seniori

## Instrumente

Și ultimul task, e puțin mai complicat, hai să vedem care sunt cele mai populare package-uri pentru fiecare domeniu

```python
import collections

import matplotlib.pyplot as plt

# group data
result = {}
for row in data:
    result.setdefault(row[0], []).extend(filter(lambda s: len(s) > 0, map(lambda s: s.strip(), row[2].split(','))))

# change size
plt.rcParams['figure.figsize'] = (5, 17)

fig, axs = plt.subplots(len(result.keys()))

ax = 0
for domain, packages in result.items():
    counter = collections.Counter(packages)
    grouped = OrderedDict(counter.most_common())
    axs[ax].set_title(domain)
    axs[ax].pie(grouped.values(), labels=grouped.keys(), autopct='%1.1f%%', startangle=40)
    axs[ax].axis('equal')

    ax += 1

fig.tight_layout(pad=5)
fig.show()

```

![Survey image](/public/assets/posts/survey/survey-3.png)

Din păcate nu atât de mulți au completat că se ocupă cu Testing sau Scrapping pentru a aduna mai multe păreri despre instrumentele care le folosesc, cum este la web development.

La moment am exersat doar cu Pie chart, dar analogic se poate realiza grafice cu Bar sau Line chart și cu `matplotlib` îmi pare mai simplu decât aș face asta în Excel!

