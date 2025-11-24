Linux-Project-Automated-User-and-Group-Management-Bash-
Bash scripts to automate user and group management on Linux, including creation, deletion, validation, and interactive menus.
 🧩 Linux Project – Automated User and Group Management (Bash)

 Objective
This project was developed as part of a Linux Ubuntu practical assignment (TP03 – Exercise 5).  
The goal is to automate the creation and deletion of users and groups using **simple and reliable Bash scripts**.

---

Project Contents

Scripts:
- **creation.sh** → Interactive script to create users and groups  
- **suppression.sh** → Interactive script to delete users and groups  

Both scripts use a **menu-based interface**:
- `u` → user  
- `g` → group  
- `f` → exit  

Each script includes:
- Name validation (letters, digits, hyphens, underscores)
- Existence checks before any action
- Safe and clean user interaction

Algorithm Logic
The full flowcharts for both scripts are available here:  
🔗 **Lucidchart link:**  
https://lucid.app/lucidchart/02f07bc5-e454-49e6-a16b-d9ed4239e48c/edit?viewport_loc=-19614%2C3771%2C20480%2C8661%2C0_0&invitationId=inv_122aae10-2caf-401c-97cd-6aee120b0fe9

---

 How to Run the Scripts

Make them executable:
```bash
chmod +x creation.sh
chmod +x suppression.sh
