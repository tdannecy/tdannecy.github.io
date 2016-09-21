---
layout: post
title: Displaying ZawGyi and Myanmar unicode fonts on Chrome
published: true

tags: tech
---

Chrome doesn't display Burmese language characters correctly and 
you won't be able to read anything on websites written in them. 
Both ZawGyi or unicode characters show up as blank boxes and 
there's no way to change the Language or Input settings in Chrome 
to get them to show up. It's been this way for 51 versions.

![Table of incorrectly rendered Burmese 
font](/images/2016-06-24-burmese-font-incorrect.png)

Luckily, the [Myanmar Font Tools 
extension](https://chrome.google.com/webstore/detail/myanmar-font-tools/ckhifbinlmakgeidlbbmplikmcofaedf) 
on the Chrome Web Store adds the ability to display these 
characters. You can also check out the [Github 
repository](https://github.com/kominko/mmft) if you want to compile 
it yourself. There's no configuring or tweaking needed and after 
you've installed it, pages with Burmese characters will display 
correctly.

![Table of correctly rendered Burmese 
font](/images/2016-06-24-burmese-font-correct.png)

Honestly, I don't know why this functionality isn't available by 
default in Chrome. It's a slight annoyance, but it should be 
included in the list of languages.
