const RPC_URL = "https://testnet-rpc.elysium.kinetiq.xyz";
const EXPLORER = "https://elysium.kinetiq.xyz/testnet-explorer";
const POLL_MS = 5000;
const SAMPLE_BLOCKS = 6;

const $ = (id) => document.getElementById(id);
const number = (value) => Number(value).toLocaleString("en-US");
const shortHash = (value) => value ? value.slice(0, 10) + "…" + value.slice(-6) : "Contract creation";
const fromHex = (value) => Number.parseInt(value || "0x0", 16);
const formatHype = (hex) => {
  const value = Number(BigInt(hex || "0x0")) / 1e18;
  return value === 0 ? "0 HYPE" : value.toLocaleString("en-US", {maximumFractionDigits: 5}) + " HYPE";
};
const timeAgo = (timestamp) => {
  const seconds = Math.max(0, Math.floor(Date.now() / 1000) - timestamp);
  if (seconds < 60) return seconds + "s ago";
  if (seconds < 3600) return Math.floor(seconds / 60) + "m ago";
  return Math.floor(seconds / 3600) + "h ago";
};

async function rpc(method, params = []) {
  const response = await fetch(RPC_URL, {
    method: "POST",
    headers: {"content-type": "application/json"},
    body: JSON.stringify({jsonrpc: "2.0", id: 1, method, params})
  });
  if (!response.ok) throw new Error("RPC returned HTTP " + response.status);
  const payload = await response.json();
  if (payload.error) throw new Error(payload.error.message || "JSON-RPC error");
  return payload.result;
}

function renderBlocks(blocks) {
  $("blocks").innerHTML = blocks.map((block) => {
    const timestamp = fromHex(block.timestamp);
    return `<div class="block-row">
      <div><div class="block-num">#${number(fromHex(block.number))}</div><div class="block-meta">${new Date(timestamp * 1000).toLocaleTimeString()}</div></div>
      <div class="block-count">${block.transactions.length} TX</div>
      <div class="block-time">${timeAgo(timestamp)}</div>
    </div>`;
  }).join("");
}

function renderTransactions(blocks) {
  const transactions = blocks.flatMap((block) => block.transactions.map((tx) => ({...tx, blockNumber: block.number})))
    .sort((a,b) => fromHex(b.blockNumber) - fromHex(a.blockNumber))
    .slice(0, 12);
  if (!transactions.length) {
    $("transactions").innerHTML = '<div class="empty">No transactions in the sampled blocks.</div>';
    return;
  }
  $("transactions").innerHTML = transactions.map((tx) => {
    const href = EXPLORER + "/transaction/" + tx.hash;
    const destination = tx.to ? "To " + shortHash(tx.to) : "Contract creation";
    return `<div class="tx-row">
      <div><a class="tx-hash" href="${href}" target="_blank" rel="noreferrer">${shortHash(tx.hash)}</a><div class="tx-meta">${shortHash(tx.from)} · ${destination}</div></div>
      <div class="tx-value">${formatHype(tx.value)}</div>
    </div>`;
  }).join("");
}

async function refresh() {
  try {
    const [chainIdHex, latestHex] = await Promise.all([
      rpc("eth_chainId"),
      rpc("eth_blockNumber")
    ]);
    const chainId = fromHex(chainIdHex);
    if (chainId !== 99801) throw new Error("Wrong network: expected chain ID 99801, received " + chainId);

    const latest = fromHex(latestHex);
    const heights = Array.from({length: SAMPLE_BLOCKS}, (_, i) => latest - i).filter((n) => n >= 0);
    const blocks = await Promise.all(heights.map((height) =>
      rpc("eth_getBlockByNumber", ["0x" + height.toString(16), true])
    ));
    const validBlocks = blocks.filter(Boolean);
    if (!validBlocks.length) throw new Error("RPC returned no blocks");

    const newest = validBlocks[0];
    const creations = validBlocks.reduce((sum, block) =>
      sum + block.transactions.filter((tx) => tx.to === null).length, 0);

    $("block-height").textContent = "#" + number(fromHex(newest.number));
    $("block-age").textContent = "Produced " + timeAgo(fromHex(newest.timestamp));
    $("tx-count").textContent = number(newest.transactions.length);
    $("gas-used").textContent = number(fromHex(newest.gasUsed));
    $("deploy-count").textContent = number(creations);
    $("connection").textContent = "CONNECTED";
    $("connection").style.color = "var(--accent)";
    $("updated").textContent = "UPDATED " + new Date().toLocaleTimeString();
    $("notice").textContent = "Connected to Elysium Testnet RPC · Auto-refresh every 5 seconds";
    $("notice").classList.remove("error");
    renderBlocks(validBlocks);
    renderTransactions(validBlocks);
  } catch (error) {
    $("connection").textContent = "RPC ERROR";
    $("connection").style.color = "#ff9b9b";
    $("notice").textContent = error.message + " · Check RPC access or browser CORS settings.";
    $("notice").classList.add("error");
    if ($("blocks").textContent.includes("Waiting")) $("blocks").innerHTML = '<div class="empty error">Could not load blocks. ' + error.message + '</div>';
  }
}

refresh();
setInterval(refresh, POLL_MS);