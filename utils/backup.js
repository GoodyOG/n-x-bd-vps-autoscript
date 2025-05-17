const express = require("express");
const multer = require("multer");
const fs = require("fs");
const app = express();
const PORT = 3000;

const BACKUP_DIR = "/root/nxbd_backups";
const UPLOAD_DIR = "/root/nxbd_restore";

fs.mkdirSync(BACKUP_DIR, { recursive: true });
fs.mkdirSync(UPLOAD_DIR, { recursive: true });

app.use(express.static("public"));

const upload = multer({ dest: UPLOAD_DIR });
app.post("/restore", upload.single("restoreFile"), (req, res) => {
    const filePath = req.file.path;
    require("child_process").exec(`bash /root/n-x-bd-vps-autoscript/utils/restore.sh ${filePath}`, () => {
        res.send("Restore initiated.");
    });
});

app.get("/download", (req, res) => {
    fs.readdir(BACKUP_DIR, (err, files) => {
        const latest = files.sort().reverse()[0];
        if (latest) {
            res.download(`${BACKUP_DIR}/${latest}`);
        } else {
            res.send("No backups found.");
        }
    });
});

app.listen(PORT, () => {
    console.log(`Backup panel running on http://localhost:${PORT}`);
});