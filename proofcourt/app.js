import { createClient } from "https://esm.sh/genlayer-js@1.1.8";
import { studionet } from "https://esm.sh/genlayer-js@1.1.8/chains";

const EVIDENCE_CONTRACT = "0xABb90F7268a31B0A1015dB442cd9d074b6785153";
const EXPLORER = "https://explorer-studio.genlayer.com/address/";

let address = null;
let readClient = createClient({ chain: studionet });
let writeClient = null;

const $ = (id) => document.getElementById(id);

$("evidenceExplorer").href = EXPLORER + EVIDENCE_CONTRACT;

function setMode(mode){
  document.querySelectorAll(".mode").forEach((button) => {
    button.classList.toggle("active", button.dataset.mode === mode);
  });
  $("claimPanel").classList.toggle("hidden", mode !== "claim");
  $("milestonePanel").classList.toggle("hidden", mode !== "milestone");
}

document.querySelectorAll(".mode").forEach((button) => {
  button.addEventListener("click", () => setMode(button.dataset.mode));
});

const savedMilestone = localStorage.getItem("proofcourt_milestone_address") || "";
$("milestoneAddress").value = savedMilestone;
syncMilestoneExplorer();

$("milestoneAddress").addEventListener("input", () => {
  const value = $("milestoneAddress").value.trim();
  localStorage.setItem("proofcourt_milestone_address", value);
  syncMilestoneExplorer();
});

function syncMilestoneExplorer(){
  const value = $("milestoneAddress").value.trim();
  const link = $("milestoneExplorer");
  if (/^0x[a-fA-F0-9]{40}$/.test(value)) {
    link.href = EXPLORER + value;
    link.classList.remove("disabled");
  } else {
    link.removeAttribute("href");
    link.classList.add("disabled");
  }
}

function requireUrl(value, label){
  let parsed;
  try { parsed = new URL(value); } catch { throw new Error(label + " must be a valid URL."); }
  if (!["http:", "https:"].includes(parsed.protocol)) throw new Error(label + " must use http or https.");
  return value;
}

function requireText(value, label){
  const clean = value.trim();
  if (!clean) throw new Error(label + " is required.");
  return clean;
}

async function connectWallet(){
  if (!window.ethereum) throw new Error("No injected wallet found. Open ProofCourt in a browser with MetaMask or another EIP-1193 wallet.");
  const accounts = await window.ethereum.request({ method: "eth_requestAccounts" });
  address = accounts?.[0];
  if (!address) throw new Error("Wallet connection was not approved.");

  writeClient = createClient({
    chain: studionet,
    account: address,
    provider: window.ethereum,
  });

  await writeClient.connect("studionet");
  $("walletStatus").textContent = address.slice(0, 6) + "…" + address.slice(-4);
}

$("connectWallet").addEventListener("click", async () => {
  const button = $("connectWallet");
  button.disabled = true;
  button.textContent = "Connecting…";
  try {
    await connectWallet();
    button.textContent = "Connected";
  } catch (error) {
    button.textContent = "Connect wallet";
    alert(error?.message || String(error));
  } finally {
    button.disabled = false;
  }
});

async function ensureWallet(){
  if (!writeClient || !address) await connectWallet();
}

async function waitAccepted(hash){
  $("networkStatus").textContent = "Consensus pending…";
  try {
    await readClient.waitForTransactionReceipt({ hash });
  } finally {
    $("networkStatus").textContent = "Studionet";
  }
}

async function readEvidenceResult(){
  const [verdict, reason] = await Promise.all([
    readClient.readContract({
      address: EVIDENCE_CONTRACT,
      functionName: "get_last_verdict",
      args: [],
    }),
    readClient.readContract({
      address: EVIDENCE_CONTRACT,
      functionName: "get_last_reason",
      args: [],
    }),
  ]);
  $("claimVerdict").textContent = String(verdict);
  $("claimReason").textContent = String(reason);
}

$("verifyClaim").addEventListener("click", async () => {
  const button = $("verifyClaim");
  const txBox = $("claimTx");
  button.disabled = true;
  txBox.textContent = "Preparing transaction…";
  try {
    await ensureWallet();

    const claim = requireText($("claim").value, "Claim");
    const sourceA = requireUrl($("claimSourceA").value.trim(), "Source A");
    const sourceB = requireUrl($("claimSourceB").value.trim(), "Source B");

    const hash = await writeClient.writeContract({
      address: EVIDENCE_CONTRACT,
      functionName: "verify_claim",
      args: [claim, sourceA, sourceB],
      value: 0n,
    });

    txBox.innerHTML = `Transaction: <a href="${EXPLORER}${EVIDENCE_CONTRACT}" target="_blank" rel="noreferrer">${hash}</a>`;
    await waitAccepted(hash);
    await readEvidenceResult();
  } catch (error) {
    txBox.textContent = "Error: " + (error?.message || String(error));
  } finally {
    button.disabled = false;
  }
});

async function readMilestoneResult(contract){
  const [status, score, reason] = await Promise.all([
    readClient.readContract({ address: contract, functionName: "get_last_status", args: [] }),
    readClient.readContract({ address: contract, functionName: "get_last_score", args: [] }),
    readClient.readContract({ address: contract, functionName: "get_last_reason", args: [] }),
  ]);

  $("milestoneStatus").textContent = String(status);
  $("milestoneScore").textContent = String(score) + "/100";
  $("milestoneReason").textContent = String(reason);
}

$("judgeMilestone").addEventListener("click", async () => {
  const button = $("judgeMilestone");
  const txBox = $("milestoneTx");
  button.disabled = true;
  txBox.textContent = "Preparing transaction…";

  try {
    await ensureWallet();

    const contract = $("milestoneAddress").value.trim();
    if (!/^0x[a-fA-F0-9]{40}$/.test(contract)) throw new Error("Paste the final MilestoneJudge contract address under Contract configuration.");

    const milestone = requireText($("milestone").value, "Milestone");
    const criteria = requireText($("criteria").value, "Acceptance criteria");
    const sourceA = requireUrl($("milestoneSourceA").value.trim(), "Source A");
    const sourceB = requireUrl($("milestoneSourceB").value.trim(), "Source B");

    const hash = await writeClient.writeContract({
      address: contract,
      functionName: "judge_milestone",
      args: [milestone, criteria, sourceA, sourceB],
      value: 0n,
    });

    txBox.innerHTML = `Transaction: <a href="${EXPLORER}${contract}" target="_blank" rel="noreferrer">${hash}</a>`;
    await waitAccepted(hash);
    await readMilestoneResult(contract);
  } catch (error) {
    txBox.textContent = "Error: " + (error?.message || String(error));
  } finally {
    button.disabled = false;
  }
});
