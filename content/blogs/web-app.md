---
title: "Building My First Web Application: Field Stations Map"
date: 2024-03-12
tags: ["Web Development", "Google Maps API", "JavaScript", "Google Cloud"]
description: "How I built my first web application using Google's Maps API to display field stations on an interactive map."
author: "Vaibhav Kulkarni"
draft: false
---

Building my first web application, **[FieldStationsMap](https://github.com/vkulk094/FieldStationsMap)**, was an incredible learning experience that introduced me to web development, cloud-based services, and Google's mapping technologies. With the help of **Google Maps API** and **Google Cloud Console**, I created an interactive web app that visualizes field stations on a dynamic map. Over time, I also made significant quality-of-life improvements to enhance the application’s functionality and usability.

## Concept and Purpose
The **FieldStationsMap** project aims to visualize the locations of various field stations on an interactive map. I wanted to create a tool that would make it easy to explore the geographic distribution of field stations, with a focus on both ease of use and performance. 

## Choosing the Tech Stack
To build this project, I leveraged **Google Maps API** for displaying and interacting with maps, and **Google Cloud Console** to manage the API keys and billing. Here's the stack I used:

- **Google Maps JavaScript API**: The primary tool for rendering the interactive map and handling geolocation services. Google Maps API provides robust features for customizing map markers, layers, and zoom controls.
- **HTML, CSS, and JavaScript**: The foundation of the web app. I used vanilla JavaScript to interact with the Maps API and handle the map's logic, while HTML and CSS provided structure and style.
- **Google Cloud Console**: Used for setting up and managing the Google Maps API keys, project billing, and monitoring usage statistics.

Using **Google Maps API** allowed me to create a highly interactive and feature-rich map, while **Google Cloud Console** ensured the backend infrastructure was scalable and secure.

## Building the Application
The core functionality of the web app revolves around displaying field stations as markers on the map.

### Key Features:
- **Dynamic Markers**: Using Google Maps API, I added markers to represent each field station. The location data was sourced from an external file, which contained the geographic coordinates (latitude and longitude) of the stations.
- **Custom Info Windows**: When users click on a marker, an info window pops up with more details about the field station, such as the name, location, and a brief description.
- **Map Controls**: The application includes zoom controls, map layers, and basic navigation buttons to allow users to explore different regions more easily.

## Quality of Life Improvements
After deploying the initial version of the app, I focused on making several improvements based on feedback and new features I wanted to explore:

### 1. **Improved Performance with Clustering**
With more field stations being added over time, the map became cluttered with too many markers. To resolve this, I implemented **marker clustering** using Google's MarkerClusterer library. This automatically groups markers into clusters when they are close to each other, improving performance and map readability.

### 2. **Responsive Design**
In the early stages, the app was primarily desktop-focused. I later refactored the layout to ensure it was responsive and mobile-friendly. The map now adjusts smoothly to different screen sizes, allowing for seamless use on both smartphones and tablets.

### 3. **Optimizing API Calls**
To reduce the number of API calls, I refactored the code to batch-fetch markers based on the user's zoom level and map position. This way, the app only loads relevant markers, which significantly improved performance, especially when zooming out to show larger areas.

### 4. **Custom Map Styles**
To give the app a unique look, I utilized **Google Maps styling** options to customize the appearance of the map. By adjusting the colors, contrast, and visibility of various map elements, I was able to make the map visually distinctive while maintaining usability.

### 5. **Deployment and Updates via Google Cloud**
For deployment, I continued to use **GitHub Pages** for hosting the static front-end, but I relied on **Google Cloud Console** for managing the backend services and API keys. This setup allowed me to scale the app effortlessly as more users began interacting with it. Additionally, I used Google Cloud’s **monitoring tools** to track API usage and set quotas to avoid unexpected overages.

## Challenges and Lessons Learned
While the development process was exciting, it came with its own set of challenges:

- **Managing API Quotas**: One of the main challenges with using Google's services was managing the API quotas. The free tier was sufficient initially, but as the app grew, I had to closely monitor API usage to ensure I didn't exceed the limits. I set up **billing alerts** to avoid unexpected charges.
- **Geocoding and Latency**: When adding new field stations, I initially relied on the Google Maps Geocoding API to convert addresses into coordinates. This occasionally led to latency issues, which I later mitigated by caching geocoded results locally.
- **Mobile Usability**: Making the map as responsive and functional on mobile as it was on desktop required extensive testing and CSS tweaks, but it was worth the effort to ensure accessibility on all devices.

## Key Takeaways
Building the **FieldStationsMap** taught me a lot about integrating cloud-based services and optimizing web applications for performance and scalability. Some of the key lessons I learned include:

- **API Management**: Understanding the limitations of external APIs and how to manage quotas effectively is crucial, especially when working with high-traffic applications.
- **User-Centered Design**: Continuously improving the UI and responsiveness based on user feedback made the app more engaging and easier to use.
- **Performance Optimization**: Reducing API calls and optimizing how data is loaded based on user interaction led to significant performance improvements, making the app faster and more responsive.

## Conclusion
The FieldStationsMap project was a great introduction to working with Google Maps API and cloud-based services. As I continue to refine the app and add new features, I'm excited to see how it evolves and to apply the skills I’ve gained to future projects.
