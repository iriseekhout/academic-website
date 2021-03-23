---
# An instance of the Contact widget.
# Documentation: https://sourcethemes.com/academic/docs/page-builder/
widget: contact
active: true
# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 130

title: Contact
subtitle:

content:
  # Automatically link email and phone or display as text?
  autolink: true
  
  # Email form provider
  form:
    provider: netlify
    netlify:
      # Enable CAPTCHA challenge to reduce spam?
      captcha: true
  
design:
  columns: '2'
---

<form name="contact" method="POST" data-netlify="true">
  <p>
    <label>Your Name: <br>
    <input type="text" name="name" /></label>   
  </p>
  <p>
    <label>Your Email: <br>
    <input type="email" name="email" /></label>
  </p>
  <p>
    <label>Message: <br>
    <textarea name="message" rows="8"></textarea></label>
  </p>
  <p>
    <button type="submit">Send</button>
  </p>
</form>



