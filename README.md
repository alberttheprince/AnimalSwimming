# 🐾 Animal Swim Module for FiveM

Make animals swim properly and naturally in water! This lightweight client-side script prevents animal peds (like dogs) from drowning or ragdolling in water, applying smooth upward force and preserving immersion when players use animal models.

---

## ✨ Features

- Automatically Detects if the player is using an animal ped
- Applies dynamic float behavior in deep and shallow water
- Prevents animal drowning by restoring health
- Disables ragdoll in water, re-enables on land
- Smooth transitions and force control for natural movement
- This does **not** modify or interfere with non-animal peds or vehicles.
- Great for K9 RP, wildlife servers, or animal mods.

---

## 📸 Preview

<div align="left">
      <a href="https://www.youtube.com/watch?v=3Yisj38mM34">
         <img src="https://img.youtube.com/vi/3Yisj38mM34/0.jpg" style="width:50%;">
      </a>
</div>


Preview: https://youtu.be/3Yisj38mM34

---


## 🧠 How It Works

When a player loads into the server, the script checks if their ped is an animal (`GetPedType(ped) == 28`). If so, it applies buoyancy logic every 200ms when the player is in water and not in a vehicle. It prevents drowning, sinking, and bouncing too high in the water, giving a much more realistic feel for roleplay scenarios involving dogs or other animals.

---

## 📂 Installation

1. **Download or clone the resource** into your `resources` folder:

2. **Add the resource to your server config** (`server.cfg`):

---


## 👨‍💻 Credits

[Popcorn RP community](https://discord.gg/popcornroleplay) for helping me test/modify this resource

Cloutmatic for making the original script
For support or questions, contact me on the FiveM forums under Gatorsman98 or Join Our New Discord!

https://discord.gg/RQQyRpg2vB
