# PMG-Whitelist-Automation
This script helps eliminate false positives. When the recipient replies to my client, their domain is already registered on a whitelist within PMG to avoid being filtered.

I have cPanel and Postfix servers at my clients, and they all use my PMG servers to send their messages.
The idea is to anticipate replies from future senders from these users and "warn" Spamassassin that these cases can be accepted without concern.

The verifica-white.sh reads the centralized /var/log/mail.log of my PMG cluster, searching for email addresses that successfully received messages.

I look for two status codes: 250 2.6.0 and 250 2.0.0.

250 2.6.0 means successful email delivery.
250 2.0.0 means successful action.

I filter by free email domains like Gmail/Hotmail/Yahoo and other domain extensions that I handle differently in PMG.
I remove the domains already registered in PMG from the list and obtain a list of new domains.

After reviewing the list, I use the adiciona-whitelist-global-from.sh script to add the new domains to my PMG whitelist database.
