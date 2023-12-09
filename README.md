<div align="center">
  <h1>Yacht Rental</h1>
</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
  - [ ERD Diagram](#erd-diagram)
  - [Kanban Board](#Kanban-Board)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Deployment](#deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Yacht Rental <a name="about-project"></a>

**Yacht Rental** is the react client of  a full stack yacht reservation web application built on the rails API.The main function of the app is to allow users to book reservations for renting a yacht.

=> [Here is the Yacht Rental frontend](https://github.com/HtetWaiYan7191/yacht_rental_front_end.git)

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **The user can signup and login to the website to make reservation.**
- **The user can see links to: Yachts, Reserve, My Reservations, Add Yacht and Delete Yacht**
- **The user can see a list of yachts**
- **The user  can select the item and see details of the item**
- **The user clicks the "Add yacht" link in the navigation panel they can see a form for adding a new yacht.**
- **When the user clicks the "Delete yacht" link in the navigation panel they can see a list of all items with title and "Delete" button.**
- **When the user clicks the "My reservations" link in the navigation panel they can see a list of their reservations (with information about item name, date and city).**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 🚀 Live Demo <a name="live-demo"></a>

- <a href="https://beta-yacht-rental.netlify.app/">Yacht Rental Live</a>
- <a href="https://beta-yacht-rental.onrender.com/api-docs/index.html">API Documentation</a>

##  ERD Diagram <a name="erd-diagram"></a>

<img src="./image.png" alt="logo" width="auto"  height="auto" />

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Kanban Board <a name="Kanban-Board"></a>

 ## A Team of 3 Members worked on this project - [See list of authors](#authors)
   - <a href="https://github.com/K0ppai/yacht-rental-backend/projects/1">Kanban Board Link</a>

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- `React`
- `Redux`
- `Rails`
- `Tailwind CSS and HTML`
- `Code editor (VSCode)`

### Setup

Clone this repository to your desired folder:

```sh
  git clone https://github.com/K0ppai/yacht-rental-backend.git
```

### Install

Install this project run these commands in order:

```sh
  cd my-project
  bundle install
  rails db:create
  rails db:migrate
  rails db:seed
```

### Usage


To run the project, execute the following command:

```sh
  rails server
```

To run tests for controllers(request) and for API Documentation, run the following command:

Install the gem -
 Add the `gem 'rswag'` and `gem 'rswag-ui'` in your gem file and run `bundle install`

Run

```sh
  rails generate rswag:install
```

### If you're trying to run the app on local, kindly set up the following,

- You need to delete config/credentials.yml.enc first.
- Generate a secret by typing this cmd in the terminal:

```sh
 bundle exec rake secret
``` 

```sh
 EDITOR='code --wait' rails credentials:edit 
``` 
 
- and once the encrypted .yml is opened
- Copy this `devise_jwt_secret_key: (copy and paste the generated secret here)`
- After copying the secret key in the encrypted .yml file, close it to save. For further information, kindly visit this [link](https://sdrmike.medium.com/rails-7-api-only-app-with-devise-and-jwt-for-authentication-1397211fb97c).

### Update CORS

- config/initializers/cors.rb

```sh
Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins 'https://localhost:5173'
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose: [:Authorization]
  end

  allow do
    origins '*' # Your frontend app deploy link
    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             expose: [:Authorization]
  end
end

```
- If you want to run in local dev kindly update origins to your frontend app url.

### Deployment

You can deploy this project using your own deployment solution

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Htet Wai Yan**

- GitHub: [@HtetWaiYan7191](https://github.com/HtetWaiYan7191)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/htet-wai-yan-903354263/)

👤 **Paing Soe Thu**

- GitHub: [@K0ppai](https://github.com/K0ppai)
- Twitter: [@_koppai_](https://twitter.com/_koppai_)
- LinkedIn: [LinkedIn](https://www.linkedin.com/in/paingsoe-thu)

👤 **Than Myo Htet**

- GitHub: [@YoutLone](https://github.com/YoutLone)
- LinkedIn: [than-myo-htet-618b2524b](https://linkedin.com/in/than-myo-htet-618b2524b)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **Add an option to buy new yacht**
- **Implement Edit button in the Delete yacht section**
- **Redirect the email confirmation link to login page**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/K0ppai/yacht-rental-backend/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project consider adding a ⭐️

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

Original design idea by [Murat Korkmaz on Behance](https://www.behance.net/gallery/26425031/Vespa-Responsive-Redesign).

We would like to thank [Microverse](https://bit.ly/MicroverseTN).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

