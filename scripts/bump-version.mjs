import fs from "node:fs/promises";
import path from "node:path";

const rootDir = process.cwd();
const versionFilePath = path.join(rootDir, "VERSION.json");
const rootPackagePath = path.join(rootDir, "package.json");
const backendPackagePath = path.join(rootDir, "backend", "package.json");
const flutterPubspecPath = path.join(rootDir, "mobile_flutter_app", "pubspec.yaml");
const legacyVersionPath = path.join(rootDir, "klarando-version.json");

function parseReleaseNameArg(argv) {
  const releaseNameIndex = argv.findIndex((arg) => arg === "--releaseName");
  if (releaseNameIndex >= 0 && argv[releaseNameIndex + 1]) {
    return argv[releaseNameIndex + 1].trim();
  }

  const prefixed = argv.find((arg) => arg.startsWith("--releaseName="));
  if (prefixed) {
    return prefixed.split("=").slice(1).join("=").trim();
  }
  return null;
}

function bumpPatchVersion(version) {
  const parts = version.split(".").map((entry) => Number.parseInt(entry, 10));
  if (parts.length !== 3 || parts.some((value) => Number.isNaN(value) || value < 0)) {
    throw new Error(`Ungültige Version in VERSION.json: ${version}`);
  }
  const [major, minor, patch] = parts;
  return `${major}.${minor}.${patch + 1}`;
}

function prettyJson(value) {
  return `${JSON.stringify(value, null, 2)}\n`;
}

async function main() {
  const argv = process.argv.slice(2);
  const customReleaseName = parseReleaseNameArg(argv);
  const buildTimeIso = new Date().toISOString();

  const versionRaw = await fs.readFile(versionFilePath, "utf8");
  const versionData = JSON.parse(versionRaw);

  const nextVersion = bumpPatchVersion(versionData.version);
  const nextBuildNumber = Number(versionData.buildNumber || 0) + 1;
  const releaseName = customReleaseName || versionData.releaseName || "Release";

  const nextVersionData = {
    ...versionData,
    version: nextVersion,
    releaseName,
    buildNumber: nextBuildNumber,
    gitCommit: process.env.GIT_COMMIT_SHA || versionData.gitCommit || null,
    buildTime: buildTimeIso,
    environment: process.env.NODE_ENV || versionData.environment || null,
  };
  await fs.writeFile(versionFilePath, prettyJson(nextVersionData), "utf8");

  const rootPackage = JSON.parse(await fs.readFile(rootPackagePath, "utf8"));
  rootPackage.version = nextVersion;
  rootPackage.klarandoVersion = nextVersion;
  rootPackage.klarandoBuildDateUtc = buildTimeIso;
  await fs.writeFile(rootPackagePath, prettyJson(rootPackage), "utf8");

  const backendPackage = JSON.parse(await fs.readFile(backendPackagePath, "utf8"));
  backendPackage.version = nextVersion;
  backendPackage.klarandoVersion = nextVersion;
  backendPackage.klarandoBuildDateUtc = buildTimeIso;
  await fs.writeFile(backendPackagePath, prettyJson(backendPackage), "utf8");

  const pubspecRaw = await fs.readFile(flutterPubspecPath, "utf8");
  const nextPubspec = pubspecRaw.replace(/^version:\s*.+$/m, `version: ${nextVersion}+${nextBuildNumber}`);
  await fs.writeFile(flutterPubspecPath, nextPubspec, "utf8");

  try {
    const legacyRaw = await fs.readFile(legacyVersionPath, "utf8");
    const legacyData = JSON.parse(legacyRaw);
    legacyData.version = nextVersion;
    legacyData.frontendVersion = nextVersion;
    legacyData.backendVersion = nextVersion;
    legacyData.displayApiVersion = nextVersion;
    legacyData.mobileCustomerVersion = nextVersion;
    legacyData.mobileDriverVersion = nextVersion;
    legacyData.buildDateUtc = buildTimeIso;
    legacyData.updatedAtUtc = buildTimeIso;
    await fs.writeFile(legacyVersionPath, prettyJson(legacyData), "utf8");
  } catch {
    // Legacy-Datei ist optional.
  }

  console.log(`Version erhöht: ${versionData.version} -> ${nextVersion}`);
  console.log(`Buildnummer: ${versionData.buildNumber} -> ${nextBuildNumber}`);
  console.log(`Release-Name: ${releaseName}`);
}

main().catch((error) => {
  console.error("bump-version fehlgeschlagen:", error);
  process.exit(1);
});
