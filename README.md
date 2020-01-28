# Flic Meds Alert
Press button, send email.  In this case it is to alert family members so we can all keep track of when the medicine was last given but it's useful for anyone who wants a Flic button to send an email or run an arbitrary bash script.  

Does not require adding anything to the mac, other than the Flic app.

### Pre Reqs
1. Buy [Flic 2](https://flic.io/) button.  Just the button, not the hub
1. Download the [Flic Mac App](https://flic.io/mac-app)
    - Sign up for an account - WHY?!
1. Set up an email account to send from (I created an account just for this use case)

### sendmail setup
Probably the hardest part.  There are hundreds of ancient stack overflow posts that all almost work. Probably something different for everyone's configuration.
- Get postfix set up and sendmail running.
- Here's the [instructions](https://www.ionos.com/help/email/other-email-programs/setting-up-postfix-linux/) I found for my hosting provider
    - Except instead of `/etc/init.d/postfix reload` I had to do `sudo launchctl stop org.postfix.master && sudo launchctl start org.postfix.master`
- Test email: If you can't do send from the command line and receive the email then you're not ready to go on to the Flic part yet
    - ````printf "Subject: sendmail test \nThis was sent from the command line" | sendmail -f sender@example.com yourmail@example.com````
- It helps to tail running on your user's mail log while trying to send.  You may get some error messages there.  But not getting an error message doesn't mean you will actually get your mail!
    - `tail -f /var/mail/$(whoami)`

### Set up
1. This folder has to be installed at `~/Library/Application Scripts/com.shortcutlabs.FlicMac`
    - `git clone https://github.com/gangstead/flic-meds-alert.git ~/Library/Application\ Scripts/com.shortcutlabs.FlicMac/flic-meds-alert`
1. After every change you need to reload the app or use the menu item: Plugins -> Reload Plugins
1. Rename `config_CHANGEME.sh` to `config.sh`, and put your from and to address(es) in there
    - `mv config_CHANGEME.sh config.sh`
    - Warning the path to `config.sh` in the actions [must be absolute](https://community.flic.io/topic/27/flic-for-mac/32) so you need to change the path if you rename the project
1. Change email subject/body in ivygotmeds.sh or rename your child
1. Open Flic app, set an action to a Flic or widget.  The new plugin should be at the bottom under User-supplied plugins with 2 actions underneath
