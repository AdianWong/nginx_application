// --- 這是 V1 的設定 ---
const APP_VERSION: string = "Version 1.0";
const BG_COLOR: string = "#3498db"; // 藍色 (Blue)

// --- 以下邏輯不用動 ---

// 1. 設定背景顏色
document.body.style.backgroundColor = BG_COLOR;

// 2. 更新文字
const versionEl = document.getElementById('app-version');
if (versionEl) {
    versionEl.innerText = APP_VERSION;
}

console.log(`App started: ${APP_VERSION}`);