import hashlib

def crack_md5(target_hash):

    print("[*] Starting dictionary attack...")

    with open("passProbablyList.txt", "r", encoding="utf-8", errors="ignore") as file:
        for line in file:
            password = line.strip()

            hashed = hashlib.md5(password.encode()).hexdigest()

            if hashed == target_hash:
                print("[+] Password found:", password)
                return

    print("[-] Password not found in wordlist")


target_hash = input("Enter MD5 hash: ")

crack_md5(target_hash)
