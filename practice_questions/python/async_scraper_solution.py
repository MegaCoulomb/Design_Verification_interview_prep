# async_scraper_solution.py
import asyncio
import aiohttp

async def fetch(session, url):
    async with session.get(url) as r:
        return await r.text()

async def main(urls):
    async with aiohttp.ClientSession() as s:
        tasks = [fetch(s,u) for u in urls]
        return await asyncio.gather(*tasks)

if __name__=='__main__':
    import sys
    urls = ['https://example.com'] if len(sys.argv)==1 else sys.argv[1:]
    res = asyncio.run(main(urls)); print([len(r) for r in res])
