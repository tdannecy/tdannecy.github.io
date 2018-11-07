---

layout: post
title: Thinkpad optimization on Elementary OS 0.4 Loki

published: true

tags: tech

---

I'm using a Lenovo Thinkpad x240 with Elementary and I'm not happy with its performance. The laptop runs hot around 60&deg;C and I can barely squeeze out an hour and a half when I'm on battery. The battery life is much better on Windows 10 and anecdotally, it runs cooler.

I found a few helpful packages for Intel hardware and there are also a few Thinkpad-specific packages in the repos that promise to improve performance. After running the commands below, restart and you should be golden. I'm getting much better battery life after these and I'm not noticing a performance hit.

`sudo add-apt-repository ppa:linrunner/tlp -y && sudo apt-get update && sudo apt-get install tp-smapi-dkms acpi-call-dkms thermald intel-microcode tlp intel-gpu-tools -y && sudo tlp start`

(Mostly this post is for me. I'm sure I'll need it in the future, so I wanted to keep it bookmarked.)
