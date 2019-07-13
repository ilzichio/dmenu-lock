# dmenu-lock
Very small lockscreen for i3 written in shellscript with the use of dmenu. Runs a dmenu in a loop asking your current password, doesn't let intruder escape dmenu loop unless the right password is entered.  

***THIS PROGRAM IS NOT A SECURE SOLUTION, IT IS BARELY ENOUGH TO PROTECT YOUR COMPUTER FROM YOUR MOTHER ENTERING YOUR NEET BASEMENT. YOU HAVE BEEN WARNED!***

---   

# Installation  
Just *bindsym* key shortuct in your i3 configuration to the script. 

# Dependecies  
* **sha256sum**  
* **awk**  
* **dmenu**  

# Usage  
To add/change password enter in the shell `lock.sh add`. You will be promted to enter current password if you had any. The hash of the password will be stored in $HOME/.hash, but you can change it in the script.  

# Extensibility  
You can change **lock_action** or **unlock_action** in the script to whatever sequence of action you would like script to perform when locking/unlocking your computer. The defaults are to switch to workspace named *lock* when locking, and go to workspace *1* when unlocking.  

## TODO  
Currently .hash file is open to removal by someone who can perform actions on unlocked system, feel free to suggest how to secure .hash modifications by third-parties. 
