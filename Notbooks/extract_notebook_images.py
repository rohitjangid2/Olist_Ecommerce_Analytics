import json
import base64
from pathlib import Path

# Folder containing this script
notebooks_dir = Path(__file__).resolve().parent

# Project root
project_dir = notebooks_dir.parent

# Notebook
notebook_path = notebooks_dir / "Olist_Ecommerce_Analysis.ipynb"

# Images folder
image_dir = project_dir / "images"
image_dir.mkdir(parents=True, exist_ok=True)

# Check notebook exists
if not notebook_path.exists():
    print(f"Notebook not found: {notebook_path}")
    raise SystemExit

# Read notebook
with open(notebook_path, "r", encoding="utf-8") as f:
    notebook = json.load(f)

count = 0

# Extract existing PNG outputs
for cell in notebook.get("cells", []):
    for output in cell.get("outputs", []):
        data = output.get("data", {})

        if "image/png" in data:
            image_data = data["image/png"]

            if isinstance(image_data, list):
                image_data = "".join(image_data)

            image_bytes = base64.b64decode(image_data)

            count += 1
            filename = image_dir / f"notebook_chart_{count:02d}.png"

            with open(filename, "wb") as f:
                f.write(image_bytes)

print(f"Successfully extracted {count} notebook charts.")
print(f"Saved to: {image_dir}")