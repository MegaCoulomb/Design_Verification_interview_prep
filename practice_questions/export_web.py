"""Export practice problems to a JSON file for the web practice page.

Usage: python export_web.py <output.json>
"""
import json
import re
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
CATEGORIES = [("c", "C", ".c"), ("python", "Python", ".py"), ("systemverilog", "SystemVerilog", ".sv")]
ENTRY = re.compile(r"^## \d+\.\s*(?P<title>.+?)\s*\n- File: `(?P<slug>[^`]+)`\s*\n- Description: (?P<desc>.+?)\s*$", re.M)


def read(path):
    return path.read_text(encoding="utf-8") if path.exists() else ""


def export():
    data = []
    for folder, label, ext in CATEGORIES:
        d = HERE / folder
        problems = []
        for m in ENTRY.finditer(read(d / "README.md")):
            slug = m["slug"]
            problems.append({
                "slug": slug,
                "title": m["title"],
                "description": m["desc"],
                "starter": read(d / f"{slug}_starter{ext}"),
                "solution": read(d / f"{slug}_solution{ext}"),
                "testbench": read(d / f"{slug}_tb{ext}") if ext == ".sv" else "",
            })
        data.append({"id": folder, "label": label, "language": folder, "problems": problems})
    return data


if __name__ == "__main__":
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    out = Path(sys.argv[1])
    data = export()
    out.write_text(json.dumps(data, indent=1, ensure_ascii=False), encoding="utf-8")
    print(f"Wrote {sum(len(c['problems']) for c in data)} problems to {out}")
