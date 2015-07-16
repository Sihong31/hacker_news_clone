users = [
  {username: "spongebob",
   password: "123456",
   first_name: "sponge",
   last_name: "bob"},
  {username: "sauron",
   password: "123456",
   first_name: "dark",
   last_name: "lord"},
  {username: "gandalf",
   password: "123456",
   first_name: "gandalf",
   last_name: "the white"}
]

posts = [
  {title: "GCC 5.2 released",
   body: "GCC 5 Release Series Changes, New Features, and Fixes",
   user_id: 1,
   url:"https://gcc.gnu.org/gcc-5/changes.html?y"},
  {title: "How I nearly almost saved the Internet, starring afl-fuzz and dnsmasq",
   body: "If you know me, you know that I love DNS. I'm not exactly sure how that happened, but I suspect that Ed Skoudis is at least partly to blame. Anyway, a project came up to evaluate dnsmasq, and being a DNS server - and a key piece of Internet infrastructure - I thought it would be fun! And it was! By fuzzing in a somewhat creative way, I found a really cool vulnerability that's almost certainly exploitable (though I haven't proven that for reasons that'll become apparent later).",
   user_id: 1,
   url:"https://blog.skullsecurity.org/2015/how-i-nearly-almost-saved-the-internet-starring-afl-fuzz-and-dnsmasq"},
  {title: "The Web’s Cruft Problem",
   body: "I don’t have a term for Kyle, but I completely agree with the sentiment, and I anecdotally get this sentiment from the greater web community. Between modals, app-install prompts, mobile web fails, ads, mobile redirects, EU cookie prompts, and the like, web developers—the people who collectively create the web—increasingly hate actually using the web.",
   user_id: 1,
   url:"http://developer.telerik.com/featured/the-webs-cruft-problem"},
  {title: "Estimate the cost of a Web, iOS or Android app",
   body: "Select the items below which best describe your app and the features you require.",
   user_id: 3,
   url:"http://estimatemyapp.com/"},
  {title: "Donate to Chelsea Manning's Legal Defense",
   body: "Chelsea Manning's extraordinary act of whistleblowing continues to enrich journalism, the public, and the historic record to this day. Chelsea is currently appealing her unjust conviction and 35-year jail sentence under the Espionage Act, but her legal team is deeply in debt. Please help raise money for her appeal by donating below.",
   user_id: 3,
   url:"https://freedom.press/chelsea"},
  {title: "Killing Off Wasabi – Part 2 ",
   body: "Last time, I talked about our motivations for creating Wasabi, maintaining it for almost a decade, and finally killing it off. Today I would like to talk about the new piece of software that enabled the final phase, Roslyn. Roslyn is Microsoft’s open source compiler platform for .NET. Roslyn includes a full implementation of both the C# and the Visual Basic.NET compiler.",
   user_id: 3,
   url:"http://blog.fogcreek.com/killing-off-wasabi-part-2/"},
  {title: "InfluxDB (YC W13) is hiring a React/JS developer",
   body: "At InfluxDB, we're building a platform for storing, visualizing, and processing time-based data. Our data visualization team needs one more talented JavaScript developer who wants to build beautiful visualization and analytics tools with cutting-edge technology. We use React, Flux, Jasmine, Webpack, and Go (for our 'middle-end'). This role will be based out of our SF office in SoMa, ideally. We have a passion for open source, and an appetite for making tools that other developers can't live without.",
   user_id: 2,
   url:"https://news.ycombinator.com/item?id=9897585"},
  {title: "Google Hiring an SEO Program Manager",
   body: "Google's projects, like our users, span the globe and require managers to keep the big picture in focus. As a Program Manager at Google, you lead complex, multi-disciplinary projects. You plan requirements with internal customers and usher projects through the entire project lifecycle. This includes managing project schedules, identifying risks and clearly communicating goals to project stakeholders. Your projects often span offices, time zones and hemispheres, and it's your job to keep all the players coordinated on the project's progress and deadlines.",
   user_id: 2,
   url:"https://www.google.com/about/careers/search#!t=jo&jid=120105001"},
  {title: "How to actually learn data science",
   body: "It’s an exciting time for data science. The field is new, but growing quickly. There’s huge demand for data scientists – average compensation in SF is well north of 100 thousand dollars a year. Where there’s money, there are also people trying to earn it. The data science skills gap means that many people are learning or trying to learn data science.",
   user_id: 2,
   url:"https://www.dataquest.io/blog/how-to-actually-learn-data-science/"}
]

comments = [
  {body: "blue is greener than purple for sure",
   user_id:1,
   post_id:1},
  {body: "I said this to my friend randomly and she was like what! So funny!",
   user_id:1,
   post_id:4},
  {body: "Laugh out loud totally awesome, whoever came up with that must be really clever. I'm seriously still loling I'm gonna use this",
   user_id:1,
   post_id:7},
  {body: "HAHA! I can imagine my friend standing up in class and randomly calling out 'BANANA ERROR!'",
   user_id:2,
   post_id:3},
  {body: "A true gem. Good show!",
   user_id:2,
   post_id:5},
  {body: "Thanks. I think I will never eat any grapes again...",
   user_id:2,
   post_id:9},
  {body: "Haha, you would be surprised at how many people fell for that!",
   user_id:3,
   post_id:5},
]

users.each do |user|
  User.create(user)
end

posts.each do |post|
  Post.create(post)
end

comments.each do |comment|
  Comment.create(comment)
end

