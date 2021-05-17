import requests as rq
from bs4 import BeautifulSoup

link = "https://runtime.fivem.net/artifacts/fivem/build_proot_linux/master/"
r = rq.get(link)

soup = BeautifulSoup(r.content, "html.parser")
output = soup.findAll("a", {"class": "button is-link is-primary"})
result = output[0]["href"][2::]

print(link + result)