#!python3

import os

def get_title(file_path):
    with open(file_path, "r") as f:
        for line in f:
            title = line.strip()
            if title:
                return title.replace("# ", "")
    return "Untitled"

def generate_index():
    index_path = "docs/study-notes.md"

    disclaimer = "Ripped straight from my notebooks, so excuse the shorthands, incompleteness, and mistakes.\n\n"

    with open(index_path, "w") as f:
        f.write("# Study Notes\n")
        f.write(disclaimer)
        file_list = []
        for root, dirs, files in os.walk("docs/pages"):
            for file in files:
                path = os.path.join(root, file)
                rel_path = os.path.relpath(path, "docs")
                file_list.append(rel_path)
        file_list.sort()
        for rel_path in file_list:
            url = "/" + rel_path.replace("\\", "/").replace(".md", "")
            title = get_title(os.path.join("docs", rel_path))
            f.write(f"- [{title}]({url})\n")

if __name__ == "__main__":
    generate_index()
