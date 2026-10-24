
import os
import sys
from pathlib import Path
import uvicorn

if __name__ == "__main__":
    port = int(os.getenv("PORT", "8000"))

    # Project and backend directories
    project_dir = Path(__file__).resolve().parent
    backend_dir = project_dir / "backend"

    # Make backend importable
    sys.path.insert(0, str(backend_dir))
    os.environ["PYTHONPATH"] = str(backend_dir)

    print("\n" + "=" * 60)
    print(" OIL SIF Precursor AI & NLP Platform Starting")
    print(f" URL: http://localhost:{port}")
    print(f" API Docs: http://localhost:{port}/docs")
    print("=" * 60 + "\n")

    uvicorn.run(
        "app.main:app",
        host="0.0.0.0",
        port=port,
        reload=True,
        reload_dirs=[str(backend_dir)],
        app_dir=str(backend_dir),
    )