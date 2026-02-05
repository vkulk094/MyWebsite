---
title: "How I Built My Personal Website Using GitHub Pages and Cloudflare"
date: 2024-10-16
tags: ["Web Development", "GitHub Pages", "Cloudflare", "DNS", "SSL", "Personal Branding", "Hugo"]
description: "A step-by-step guide on how I created and optimized my personal website using GitHub Pages and Cloudflare for free hosting, enhanced performance, and security."
author: "Vaibhav Kulkarni"
draft: false
---

Building my personal website was both a rewarding and educational experience. It taught me the fundamentals of hosting, web performance, DNS management, and security, while also allowing me to create a platform to showcase my work. Using **GitHub Pages** for free and **Cloudflare** for performance optimization and security, I successfully launched a professional online presence with minimal cost. In this post, I’ll walk through how I set up the site, the tools I used, and the lessons I learned along the way.

## Why I Chose GitHub Pages and Cloudflare
As a bioinformatics researcher and developer, I wanted a professional online portfolio where I could share my projects, research, and experiences. **GitHub Pages** seemed like the perfect solution. It’s free, easy to use, and integrates seamlessly with my existing code repositories. Plus, GitHub Pages automatically deploys websites based on updates made to the repository—streamlining the whole process.

To further enhance my website's performance and security, I integrated **Cloudflare**, a content delivery network (CDN) that not only boosts website load speeds globally but also provides **SSL** encryption and protection against cyber threats. Combining these two platforms gave me a powerful, cost-effective solution to create and manage a professional website.

## Step 1: Setting Up GitHub Pages
The first step was setting up my website on GitHub Pages, which was surprisingly simple. Here’s a breakdown of the process:

1. **Creating a Repository**: I created a new repository in GitHub specifically for my website, naming it after my domain, `vaibhavkulkarni.bio`. The structure of the repository served as the backbone of my website.
   
2. **Adding Website Content**: I built my site using basic **HTML**, **CSS**, and **JavaScript**. After finalizing the code, I pushed the files to the `main` branch of the repository.

3. **Activating GitHub Pages**: In the repository settings, I enabled GitHub Pages by selecting the branch I wanted to deploy from. GitHub automatically generated a URL (`https://vaibhavkulkarni.github.io`) and served my website live from that location.

This gave me a functioning website, but to make it truly professional, I wanted to use a custom domain.

## Step 2: Integrating a Custom Domain
Having a custom domain adds a layer of professionalism and helps with personal branding. I purchased `vaibhavkulkarni.bio` and wanted it to point to my GitHub Pages website. Here's how I connected the domain:

1. **Creating a CNAME File**: In my GitHub repository, I added a `CNAME` file containing my custom domain name (`vaibhavkulkarni.bio`). This file tells GitHub that the custom domain should be linked to the repository.

2. **Updating DNS Settings**: In my domain registrar’s dashboard, I added a **CNAME record** that pointed `vaibhavkulkarni.bio` to `vaibhavkulkarni.github.io`. This step ensured that my custom domain directed visitors to my GitHub Pages site.

Within a few minutes, my website was live under `https://vaibhavkulkarni.bio`. However, I needed to secure the site with **SSL** encryption to enable HTTPS, which is critical for security and user trust.

## Step 3: Enhancing Performance and Security with Cloudflare
To improve the security and performance of my website, I integrated **Cloudflare**. Not only does Cloudflare provide **SSL certificates**, but it also enhances website speed through its global **Content Delivery Network (CDN)**. Here’s how I set it up:

1. **Adding the Domain to Cloudflare**: I registered my domain with Cloudflare, which then provided me with two **nameservers** to update in my domain registrar's dashboard. This allowed Cloudflare to manage traffic to my website.

2. **Enabling SSL**: In Cloudflare’s dashboard, I selected the **Full SSL** option, which encrypts traffic between the user, Cloudflare, and GitHub Pages. Cloudflare issued a free SSL certificate for my domain, enabling secure HTTPS connections.

3. **Activating the CDN**: Cloudflare’s CDN automatically caches static content like images, stylesheets, and JavaScript across its global server network. This means that when users visit my site, the content is served from the server closest to their location, dramatically reducing load times.

With Cloudflare’s security features and CDN in place, my website became faster, more secure, and globally accessible.

## Step 4: Overcoming Challenges
While the process was mostly smooth, I encountered a few obstacles along the way:

1. **SSL Propagation Delay**: After setting up SSL with Cloudflare, there was a delay before the HTTPS certificate became fully active. During this time, my site displayed errors when accessed via HTTPS. Fortunately, this resolved itself after a few hours.

2. **DNS Caching Issues**: After updating my DNS settings, some devices took longer to reflect the changes, causing temporary issues when accessing the site. Clearing the local DNS cache helped, but it’s something to keep in mind when making future updates.

## Rebuilding with Hugo for Better CSS Consistency
While the initial version of my site was built using plain **HTML** and **CSS**, I’ve realized that as my site grows, I need a more scalable and maintainable solution. To address issues with CSS consistency and to enable more efficient updates, I plan to **rebuild my website using Hugo**, a powerful static site generator. Hugo will allow me to structure my content more effectively, reuse CSS components, and maintain a consistent style across the site.

With Hugo, I’ll be able to manage my content better, create reusable templates, and ensure my site remains easy to maintain as I continue to add new projects and blog posts.

## Lessons Learned
Building my personal website taught me several valuable lessons, especially in terms of managing web hosting, DNS, and security:

1. **SSL is Essential**: Having HTTPS not only secures user data but also boosts search engine rankings. I learned that SSL is a must for any website, especially with the increasing importance of online privacy.

2. **Using a CDN Improves User Experience**: Cloudflare’s CDN made a significant difference in my website’s performance. With cached content served from local servers, users experience faster load times, no matter where they are.

3. **Patience with DNS Changes**: DNS propagation can take time, and issues like SSL delays or DNS cache mismatches are common. Understanding how DNS works helped me remain calm while troubleshooting these challenges.

## Conclusion
Setting up my personal website was an incredibly rewarding experience. **GitHub Pages** provided a simple and cost-effective way to host my site, while **Cloudflare** added a layer of professionalism through performance optimization and enhanced security. Together, they created a powerful, free solution for building a personal portfolio.

Looking ahead, I’m excited to rebuild my website using **Hugo** for better scalability, maintainability, and CSS consistency. If you’re looking to build your own website, I highly recommend using GitHub Pages for hosting and Cloudflare for security and performance. The combination of these two services offers a reliable and scalable solution for web development, all at no cost.

---
Want to build your own site? [Explore GitHub Pages here](https://pages.github.com/) and [learn about Cloudflare here](https://www.cloudflare.com/).
