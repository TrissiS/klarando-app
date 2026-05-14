import fs from "node:fs/promises";
import path from "node:path";

const rootDir = process.cwd();
const versionFilePath = path.join(rootDir, "VERSION.json");
const backendVersionUrl = process.env.KLARANDO_VERSION_API_URL || "https://api.klarando.com/api/version";

async function readLocalVersion() {
  const raw = await fs.readFile(versionFilePath, "utf8");
  return JSON.parse(raw);
}

async function readRemoteVersion() {
  try {
    const res = await fetch(backendVersionUrl, { method: "GET" });
    if (!res.ok) {
      return { ok: false, error: `HTTP ${res.status}` };
    }
    return { ok: true, data: await res.json() };
  } catch (error) {
    return { ok: false, error: error instanceof Error ? error.message : "Unbekannter Fehler" };
  }
}

async function main() {
  const local = await readLocalVersion();
  const remote = await readRemoteVersion();

  console.log("=== Klarando Version Check ===");
  console.log(`Lokal: v${local.version} · Build ${local.buildNumber} · ${local.releaseName}`);
  console.log(`API:   ${backendVersionUrl}`);

  if (!remote.ok) {
    console.log(`Remote: nicht erreichbar (${remote.error})`);
    process.exitCode = 1;
    return;
  }

  const data = remote.data;
  console.log(
    `Remote: v${data.version ?? "-"} · Build ${data.buildNumber ?? "-"} · ${data.releaseName ?? "-"}`
  );

  const sameVersion = String(local.version) === String(data.version);
  const sameBuild = Number(local.buildNumber) === Number(data.buildNumber);

  if (sameVersion && sameBuild) {
    console.log("Status: OK (lokal und remote synchron)");
    return;
  }

  console.log("Status: WARNUNG (lokal und remote nicht synchron)");
  process.exitCode = 1;
}

main().catch((error) => {
  console.error("version:check fehlgeschlagen:", error);
  process.exit(1);
});
